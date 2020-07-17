//
//  ContentView.swift
//  Calculator
//
//  Created by 陈晨晖 on 2020/7/15.
//  Copyright © 2020 sunner. All rights reserved.
//

import SwiftUI

enum CalculatorButtonItem {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem {
    
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot:
            return "digitBackground"
        case .op:
            return "operatorBackground"
        case .command:
            return "commandBackground"
        }
    }
}

extension CalculatorButtonItem: Hashable {}

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
//        Button(action: action) {
//            Text(title)
//            .font(.system(size: fontSize))
//            .foregroundColor(.white)
//            .frame(width: size.width, height: size.height)
//            .background(Color(backgroundColorName))
//            .cornerRadius(size.width / 2)
//        }
        
        Button(action: action) {
            ZStack(alignment: .center) {
                Circle()
                .foregroundColor(Color(backgroundColorName))
                Text(title)
                    .font(.system(size: fontSize))
                    .foregroundColor(.white)
            }
            .frame(width: size.width, height: size.height, alignment: .trailing)
        }
    }
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName)
                    {
                        print("button: \(item.title)")
                    }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),.command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .trailing)
            CalculatorButtonPad()
                .frame(
                    maxWidth: .infinity)
                .padding(.bottom, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewDevice("iPhone 8 Plus")
        }
    }
}
