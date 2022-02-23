//
//  ContentView.swift
//  ISP-CalculatorApp
//
//  Created by Dulith Thaveesha on 2022-02-22.
//

import SwiftUI

//Cases for buttons
enum Buttons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case addition = "+"
    case subtraction = "-"
    case divide = "÷"
    case mutliply = "x"
    case equal = "="
    case allClear = "AC"
    case power = "^"
    case dot = "."
    case percentage = "%"
}

struct ContentView: View {
    
    let buttons: [[Buttons]] = [
        [.allClear, .power, .percentage, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtraction],
        [.one, .two, .three, .addition],
        [.zero, .dot, .equal],
    ]

    
    var body: some View {
        ZStack {
            Color.black
            
            VStack {
                HStack {
                    //Calculator text
                    Spacer()
                    Text("0").bold().font(.system(size: 72)).foregroundColor(.white)
                }
                .padding()
                
                //Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                
                                }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(Color.teal)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                }
            }
        }
    }
    func buttonWidth(item: Buttons) -> CGFloat {
        if item == .equal {
            return (((UIScreen.main.bounds.width - 60)/4)*2)
        }
        return ((UIScreen.main.bounds.width - 60)/4)
    }

    func buttonHeight() -> CGFloat {
        return ((UIScreen.main.bounds.width - 60)/4)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
