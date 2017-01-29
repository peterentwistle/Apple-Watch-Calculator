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
    case addition
    case subtract
    case multiply
    case divide
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
        selectedOperator = .addition
        changeBackgroundColours(additionBtn)
        resetDecimal()
    }
    
    @IBAction func subtract() {
        selectedOperator = .subtract
        changeBackgroundColours(subtractBtn)
        resetDecimal()
    }
    
    @IBAction func multiply() {
        selectedOperator = .multiply
        changeBackgroundColours(multiplyBtn)
        resetDecimal()
    }
    
    @IBAction func divide() {
        selectedOperator = .divide
        changeBackgroundColours(divideBtn)
        resetDecimal()
    }
    
    @IBAction func equals() {
        let result: Float
        switch selectedOperator! {
        case .addition:
            result = firstNum.floatValue + secondNum.floatValue
        case .subtract:
            result = firstNum.floatValue - secondNum.floatValue
        case .multiply:
            result = firstNum.floatValue * secondNum.floatValue
        case .divide:
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
    
    @IBAction func clear() {
        resultLabel.setText("0")
        firstNum = String()
        secondNum = String()
        selectedOperator = nil
        resetDecimal()
        for button in operatorButtons {
            resetButtonBackgroundColour(button)
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
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
    
    func addToDisplay(_ s: Character) {
        if let _ = selectedOperator {
            secondNum.append(s)
            resultLabel.setText(secondNum)
        } else {
            firstNum.append(s)
            resultLabel.setText(firstNum)
        }
    }
    
    func changeBackgroundColours(_ selectedButton: WKInterfaceButton) {
        for button in operatorButtons {
            if button == selectedButton {
                setButtonBackgroundColourGreen(button)
            } else {
                resetButtonBackgroundColour(button)
            }
        }
    }
    
    func setButtonBackgroundColourGreen(_ button: WKInterfaceButton) {
        button.setBackgroundColor(UIColor.green)
    }
    
    func resetButtonBackgroundColour(_ button: WKInterfaceButton) {
        button.setBackgroundColor(UIColor.darkGray)
    }
    
    func resetDecimal() {
        usedDecimal = false
    }
    
}
