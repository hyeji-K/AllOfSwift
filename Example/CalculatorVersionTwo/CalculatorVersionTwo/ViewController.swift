//
//  ViewController.swift
//  CalculatorVersionTwo
//
//  Created by heyji on 2022/03/10.
//

import UIKit

class ViewController: UIViewController {
    // UIViewController 로부터 상속받았다

    @IBOutlet private var display: UILabel!
    // = nil 항상 set이 되지 않은 상태로 자동으로 초기화됨
    
    private var userIsInTheMiddleOfTyping: Bool = false
    // 스위프트에서 모든 프로퍼티는 초기값을 가져야함
    // 1. 초기화 함수 2. 초기값 지정
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
//        print("touched \(digit) digit")
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
    
    // 자동으로 디스플레이 안에 뭐가 있었는지를 추적할 변수
    // 계산 프로퍼티
    // 모든 프로퍼티가 저장만 되는 것이 아니라 연산도 될 수 있음
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    // Controller가 Model을 가지려면 직접 말을 할 수 있어야 함
    // brain 변수에게 모든 계산을 하라고 시킬 것임
    // Controller가 Model에 접근하려고 이를 통해 말을 한다고 침
    private var brain: CalculatorBrain = CalculatorBrain()
    // 초기화 지정 -> 새 클래스의 객체를 생성할 때마다 인자가 없는 initializer가 하나 자동으로 생김 = 기본 initializer
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
//            if mathematicalSymbol == "π" {
//                displayValue = .pi
////                display.text = String(Double.pi)
//            } else if mathematicalSymbol == "√" {
//                displayValue = sqrt(displayValue)
//            }
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

