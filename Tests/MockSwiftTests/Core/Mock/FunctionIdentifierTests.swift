// FunctionIdentifierTests.swift
/*
 MIT License

 Copyright (c) 2019 Davinder

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

@testable import MockSwift
import XCTest

class FunctionIdentifierTests: XCTestCase {
  func test_callDescription_withNoParametersWhenFunction() {
    let description = FunctionIdentifier(function: "f()", return: Int.self).callDescription(with: [])
    XCTAssertEqual(description, "f() -> Int")
  }

  func test_callDescription_withParametersWhenFuntion() {
    let description = FunctionIdentifier(function: "f(arg1:arg2:arg3:)", return: Int.self)
      .callDescription(with: ["description1", 2, nil])
    XCTAssertEqual(description, "f(arg1: description1, arg2: 2, arg3: nil) -> Int")
  }

  func test_callDescription_withGetProperty() {
    let description = FunctionIdentifier(function: "variable", return: Int.self).callDescription(with: [])
    XCTAssertEqual(description, "variable() -> Int")
  }

  func test_callDescription_withSetProperty() {
    let description = FunctionIdentifier(function: "variable", return: Void.self)
      .callDescription(with: [2])
    XCTAssertEqual(description, "variable(newValue: 2) -> ()")
  }

  func test_callDescription_withGetSubscript() {
    let description = FunctionIdentifier(function: "subscript(_:_:)", return: Int.self)
      .callDescription(with: [1, "description2"])
    XCTAssertEqual(description, "subscript(_: 1, _: description2) -> Int")
  }

  func test_callDescription_withSetSubscript() {
    let description = FunctionIdentifier(function: "subscript(_:_:)", return: Void.self)
      .callDescription(with: [1, "description2", 0])
    XCTAssertEqual(description, "subscript(_: 1, _: description2)(newValue: 0) -> ()")
  }
}
