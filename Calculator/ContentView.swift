//
//  ContentView.swift
//  Calculator
//
//  Created by 陈晨晖 on 2020/7/15.
//  Copyright © 2020 sunner. All rights reserved.
//

import SwiftUI

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
            .font(.system(size: fontSize))
            .foregroundColor(.white)
            .frame(width: size.width, height: size.height)
            .background(Color(backgroundColorName))
            .cornerRadius(size.width / 2)
        }
    }
}

struct ContentView: View {
    var body: some View {
        HStack {
            CalculatorButton(
                title: "1",
                size: CGSize(width: 88, height: 88),
                backgroundColorName: "digitBackground",
                action: {
                    print("button 1")
                }
            )
            CalculatorButton(
                title: "2",
                size: CGSize(width: 88, height: 88),
                backgroundColorName: "digitBackground",
                action: {
                    print("button 2")
                }
            )
            CalculatorButton(
                title: "3",
                size: CGSize(width: 88, height: 88),
                backgroundColorName: "digitBackground",
                action: {
                    print("button 3")
                }
            )
            CalculatorButton(
                title: "+",
                size: CGSize(width: 88, height: 88),
                backgroundColorName: "operatorBackground",
                action: {
                    print("button +")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
