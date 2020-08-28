//
//  ViewController.swift
//  calculator-sample
//
//  Created by g.guimaraes on 18/05/20.
//  Copyright © 2020 Guilherme Guimaraes. All rights reserved.
//

import UIKit
import CalculatorCore

enum ViewControllerInputError: LocalizedError {
    case num1TextFieldInvalid
    case num2TextFieldInvalid

    // MARK: LocalizedError conforms

    var errorDescription: String? {
        switch self {
        case .num1TextFieldInvalid:
            return "First number is invalid"
        case .num2TextFieldInvalid:
            return "Second number is invalid"
        }
    }
}

class CalculatorViewController: UIViewController, ViewCode {
    private let num1TextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "First number"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white

        return textField
    }()

    private let num2TextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Second number"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white

        return textField
    }()

    private let operationSymbolTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Operation symbol"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white

        return textField
    }()

    private let resultLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0

        return label
    }()

    private let operateButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Operate", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1

        button.addTarget(self, action: #selector(CalculatorViewController.operate), for: .touchUpInside)

        return button
    }()

    // MARK: Initializer

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupView()
    }

    // MARK: ViewCode conforms

    func buildViewHierarchy() {
        view.addSubview(num1TextField)
        view.addSubview(num2TextField)
        view.addSubview(operationSymbolTextField)
        view.addSubview(operateButton)
        view.addSubview(resultLabel)
    }

    func setupConstraints() {
        view.addSubview(num1TextField, [
            num1TextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            num1TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            num1TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        view.addSubview(num2TextField, [
            num2TextField.topAnchor.constraint(equalTo: num1TextField.bottomAnchor, constant: 16),
            num2TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            num2TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        view.addSubview(operationSymbolTextField, [
            operationSymbolTextField.topAnchor.constraint(equalTo: num2TextField.bottomAnchor, constant: 16),
            operationSymbolTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            operationSymbolTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        view.addSubview(operateButton, [
            operateButton.topAnchor.constraint(equalTo: operationSymbolTextField.bottomAnchor, constant: 16),
            operateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            operateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            operateButton.heightAnchor.constraint(equalToConstant: 32)
        ])

        view.addSubview(resultLabel, [
            resultLabel.topAnchor.constraint(equalTo: operateButton.bottomAnchor, constant: 16),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }

    // MARK: Actions

    @objc func operate(_ sender: Any) {
        do {
            guard let num1 = Double(num1TextField.text ?? "") else {
                throw ViewControllerInputError.num1TextFieldInvalid
            }

            guard let num2 = Double(num2TextField.text ?? "") else {
                throw ViewControllerInputError.num2TextFieldInvalid
            }

            let calculator = Calculator()
            calculator.num1 = num1
            calculator.num2 = num2
            calculator.operationSymbol = operationSymbolTextField.text

            resultLabel.text = "\(try calculator.operate())"
        } catch {
            resultLabel.text = error.localizedDescription
        }
    }

}

