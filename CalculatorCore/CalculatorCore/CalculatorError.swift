//
//  CalculatorError.swift
//  calculator-sample
//
//  Created by g.guimaraes on 22/05/20.
//  Copyright © 2020 Guilherme Guimaraes. All rights reserved.
//

import Foundation

public enum CalculatorError: LocalizedError {
    case num1IsNil
    case num2IsNil
    case operationSymbolIsNil
    case unknownSymbol

    // MARK: LocalizedError conforms

    public var errorDescription: String? {
        switch self {
        case .num1IsNil:
            return "First number is nil"
        case .num2IsNil:
            return "Second number is nil"
        case .operationSymbolIsNil:
            return "Operation symbol is nil"
        case .unknownSymbol:
            return "The operation symbol is unknown"
        }
    }
}
