//
//  ViewController.swift
//  KeyboardAndTextField
//
//  Created by heyji on 2022/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var thirdTextField: UITextField!
    @IBOutlet var fourthTextField: UITextField!
    @IBOutlet var fifthTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKeyboardHiding()
        
    }
    // TODO: TextField가 UIView의 중간에 위치하지 않으면 클릭시 중간에 오도록 구현하기
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
//        view.frame.origin.y = view.frame.origin.y - 200
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
        
        print(view.frame.width)
        print(view.frame.height)
        let locationOfMiddle: CGFloat = view.frame.height / 2
        print(locationOfMiddle)
        
//        view.frame.origin.y = -locationOfMiddle
        

//        print("foo - userInfo: \(userInfo)")
//        print("foo - keyboardFrame: \(keyboardFrame)")
//        print("foo - currentTextField: \(currentTextField)")
        
        
        // check if the top of the keyboard is above the bottom of the currently focused textbox
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
//        print("foo - currentTextFieldFrame: \(currentTextField.frame)")
//        print("foo - convertedTextFieldFrame: \(convertedTextFieldFrame)")

        // if textField bottom is below keyboard bottom - bump the frame up
        if textFieldBottomY > locationOfMiddle {
            // adjust view up
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 1.5) * -1
            print(newFrameY)
            view.frame.origin.y = newFrameY
        } else if textFieldBottomY < locationOfMiddle && textFieldBottomY < locationOfMiddle * 1/2 {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 1.5) * -1
            print("textFieldBottomY -> \(textFieldBottomY)")
            print(locationOfMiddle * 1/2)
            view.frame.origin.y = newFrameY
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }

    // MARK: view 아무곳이나 터치하면 키보드 내려가도록 구현
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    
    
}
