//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by g.guimaraes on 05/08/20.
//  Copyright © 2020 Guilherme Guimaraes. All rights reserved.
//

import XCTest
@testable import CalculatorCore

class CalculatorTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSum() throws {
        let calculator = Calculator()
        calculator.operationSymbol = "+"

        // MARK: Example 1

        calculator.num1 = 2
        calculator.num2 = 3

        XCTAssertEqual(try calculator.operate(), 5)

        // MARK: Example 2

        calculator.num1 = 3
        calculator.num2 = 3

        XCTAssertEqual(try calculator.operate(), 6)

        // MARK: Example 3

        calculator.num1 = 33
        calculator.num2 = 32

        XCTAssertEqual(try calculator.operate(), 65)
    }

    func testSubtraction() throws {
        let calculator = Calculator()
        calculator.operationSymbol = "-"

        // MARK: Example 1

        calculator.num1 = 2
        calculator.num2 = 3

        XCTAssertEqual(try calculator.operate(), -1)

        // MARK: Example 2
        
        calculator.num1 = 3
        calculator.num2 = 3

        XCTAssertEqual(try calculator.operate(), 0)

        // MARK: Example 3

        calculator.num1 = 33
        calculator.num2 = 32

        XCTAssertEqual(try calculator.operate(), 1)
    }

    func testMultiplicationUnavailable() throws {
        let calculator = Calculator()
        calculator.operationSymbol = "*"

        // MARK: Example 1 (since its not implemented)

        calculator.num1 = 2
        calculator.num2 = 3

        XCTAssertThrowsError(try calculator.operate())
    }
}
