//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 陈晨晖 on 2020/7/21.
//  Copyright © 2020 sunner. All rights reserved.
//

import Combine

class CalculatorModel: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    var brain: CalculatorBrain = .left("0") {
        willSet { objectWillChange.send() }
    }
}
