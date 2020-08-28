//
//  Calculator.swift
//  calculator-sample
//
//  Created by g.guimaraes on 18/05/20.
//  Copyright © 2020 Guilherme Guimaraes. All rights reserved.
//

public class Calculator {
    public var num1: Double?
    public var num2: Double?
    public var operationSymbol: String?

    public init() { }

    // MARK: Functions

    public func operate() throws -> Double {
        guard let num1 = num1 else {
            throw CalculatorError.num1IsNil
        }

        guard let num2 = num2 else {
            throw CalculatorError.num2IsNil
        }

        guard let operationSymbol = operationSymbol else {
            throw CalculatorError.operationSymbolIsNil
        }

        switch operationSymbol {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        default:
            throw CalculatorError.unknownSymbol
        }
    }
}
