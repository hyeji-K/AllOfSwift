//
//  ViewController.swift
//  CalculatorVersionTwo
//
//  Created by heyji on 2022/03/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var display: UILabel!
    // = nil 항상 set이 되지 않은 상태로 자동으로 초기화됨
    
    private var userIsInTheMiddleOfTyping: Bool = false
    // 스위프트에서 모든 프로퍼티는 초기값을 가져야함
    // 1. 초기화 함수 2. 초기값 지정
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            // 숫자를 입력중이라면
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            // 입력중이 아닌 처음 숫자를 입력할때
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    // 자동으로 디스플레이 안에 뭐가 있었는지를 추적할 변수 => 계산 프로퍼티
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    // Controller가 Model에 접근하기위한 변수 지정
    private var brain: CalculatorBrain = CalculatorBrain()

    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

