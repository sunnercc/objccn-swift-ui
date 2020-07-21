//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 陈晨晖 on 2020/7/21.
//  Copyright © 2020 sunner. All rights reserved.
//

import Combine

class CalculatorModel: ObservableObject {
    @Published var brain: CalculatorBrain = .left("0")
    @Published var history: [CalculatorButtonItem] = []
    
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
    }
}
