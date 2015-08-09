//  InterfaceController.swift
//
//  Copyright (c) 2015 Peter Entwistle
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import WatchKit
import Foundation

enum Operator {
    case Addition
    case Subtract
    case Multiply
    case Divide
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

class InterfaceController: WKInterfaceController {
    
    var firstNum = String()
    var secondNum = String()
    var selectedOperator: Operator?
    var usedDecimal = false
    var operatorButtons = [WKInterfaceButton]()
    
    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var divideBtn: WKInterfaceButton!
    @IBOutlet var multiplyBtn: WKInterfaceButton!
    @IBOutlet var subtractBtn: WKInterfaceButton!
    @IBOutlet var additionBtn: WKInterfaceButton!
    
    
    @IBAction func zero() {
        addToDisplay("0")
    }
    
    @IBAction func one() {
        addToDisplay("1")
    }
    
    @IBAction func two() {
        addToDisplay("2")
    }
    
    @IBAction func three() {
        addToDisplay("3")
    }
    
    @IBAction func four() {
        addToDisplay("4")
    }
    
    @IBAction func five() {
        addToDisplay("5")
    }
    
    @IBAction func six() {
        addToDisplay("6")
    }

    @IBAction func seven() {
        addToDisplay("7")
    }
    
    @IBAction func eight() {
        addToDisplay("8")
    }
    
    @IBAction func nine() {
        addToDisplay("9")
    }
    
    @IBAction func addition() {
        selectedOperator = .Addition
        changeBackgroundColours(additionBtn)
    }
    
    @IBAction func subtract() {
        selectedOperator = .Subtract
        changeBackgroundColours(subtractBtn)
    }
    
    @IBAction func multiply() {
        selectedOperator = .Multiply
        changeBackgroundColours(multiplyBtn)
    }
    
    @IBAction func divide() {
        selectedOperator = .Divide
        changeBackgroundColours(divideBtn)
    }
    
    @IBAction func equals() {
        let result: Float
        switch selectedOperator! {
        case .Addition:
            result = firstNum.floatValue + secondNum.floatValue
        case .Subtract:
            result = firstNum.floatValue - secondNum.floatValue
        case .Multiply:
            result = firstNum.floatValue * secondNum.floatValue
        case .Divide:
            result = firstNum.floatValue / secondNum.floatValue
        }
        resultLabel.setText(result.description)
    }
    
    @IBAction func decimal() {
        if !usedDecimal {
            addToDisplay(".")
            usedDecimal = true
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        operatorButtons.append(divideBtn)
        operatorButtons.append(multiplyBtn)
        operatorButtons.append(subtractBtn)
        operatorButtons.append(additionBtn)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func addToDisplay(s: Character) {
        if let _ = selectedOperator {
            secondNum.append(s)
            resultLabel.setText(secondNum)
        } else {
            firstNum.append(s)
            resultLabel.setText(firstNum)
        }
    }
    
    func changeBackgroundColours(selectedButton: WKInterfaceButton) {
        for button in operatorButtons {
            if button == selectedButton {
                setButtonBackgroundColourGreen(button)
            } else {
                resetButtonBackgroundColour(button)
            }
        }
    }
    
    func setButtonBackgroundColourGreen(button: WKInterfaceButton) {
        button.setBackgroundColor(UIColor.greenColor())
    }
    
    func resetButtonBackgroundColour(button: WKInterfaceButton) {
        button.setBackgroundColor(UIColor.darkGrayColor())
    }
}
