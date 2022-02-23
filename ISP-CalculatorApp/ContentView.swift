//
//  ContentView.swift
//  ISP-CalculatorApp
//
//  Created by Dulith Thaveesha on 2022-02-22.
//
//
//  ContentView.swift
//  CalculatorApp
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

    //Cases for button colors
    var buttonColor: Color {
        switch self {
        case .addition, .subtraction, .mutliply, .divide, .power, .percentage:
            return .teal
        case .equal:
            return .orange
        case .allClear:
            return .blue
        default:
            return .gray
        }
    }
}

enum Operation {
    case addition, subtraction, multiply, divide, none
}

struct ContentView: View {

    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none

    //Button layout
    let buttons: [[Buttons]] = [
        [.allClear, .power, .percentage, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtraction],
        [.one, .two, .three, .addition],
        [.zero, .dot, .equal],
    ]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                //Display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                }
                .padding()

                //Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }

    //Button functions
    func didTap(button: Buttons) {
        switch button {
        case .addition, .subtraction, .mutliply, .divide, .power, .equal:
            if button == .addition {
                self.currentOperation = .addition
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtraction {
                self.currentOperation = .subtraction
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .mutliply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .addition: self.value = "\(runningValue + currentValue)"
                case .subtraction: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }

            if button != .equal {
                self.value = "0"
            }
        case .allClear:
            self.value = "0"
        case .dot, .percentage:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }

    //Calculate button width compared to screen size
    func buttonWidth(item: Buttons) -> CGFloat {
        if item == .equal {
            return (((UIScreen.main.bounds.width - 60)/4)*2)
        }
        return ((UIScreen.main.bounds.width - 60)/4)
    }
    //Calculate button height compared to screen size
    func buttonHeight() -> CGFloat {
        return ((UIScreen.main.bounds.width - 60)/4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
