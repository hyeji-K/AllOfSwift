//
//  ViewController.swift
//  CalculatorVersionTwo
//
//  Created by heyji on 2022/03/10.
//

import UIKit // 모듈 (클래스를 여러개를 묶어 그룹으로 만든 것)
// UIKit은 Button, TextField 같은 모든 UI
// UI에 독립적인 Model에는 Foundation을 import. Foundation은 Core Service.
// Model에서 네트워킹이나 데이터베이싱 작업을 함

class ViewController: UIViewController {
    // UIViewController 로부터 상속받았다

    @IBOutlet var display: UILabel!
    // = nil 항상 set이 되지 않은 상태로 자동으로 초기화됨
    
    var userIsInTheMiddleOfTyping: Bool = false
    // 스위프트에서 모든 프로퍼티는 초기값을 가져야함
    // 1. 초기화 함수 2. 초기값 지정
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
//        print("touched \(digit) digit")
        if userIsInTheMiddleOfTyping {
            // 입력중이라면
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            // 입력중이 아니라면
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                display.text = String(Double.pi)
            }
        }
    }
    
}

