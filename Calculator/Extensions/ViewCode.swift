//
//  ViewCode.swift
//  calculator-sample
//
//  Created by ??? on 05/08/20.
//  Copyright © 2020 Guilherme Guimaraes. All rights reserved.
//

public protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    public func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    public func setupAdditionalConfiguration() { }
}
