//
//  RoundAndShadowViewController.swift
//  KeyboardAndTextField
//
//  Created by heyji on 2022/04/22.
//

import UIKit

class RoundAndShadowViewController: UIViewController {

    @IBOutlet var testUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: UIView cornerRadius
        testUIView.layer.cornerRadius = 50
        testUIView.layer.borderWidth = 10
        testUIView.layer.borderColor = UIColor.systemPink.cgColor
//        testUIView.backgroundColor = .purple
        
        
        // MARK: UIView shadow
        // UIBezierPath
        testUIView.layer.shadowOpacity = 1
//        testUIView.layer.shadowOffset = CGSize(width: 50, height: 50)
        testUIView.layer.shadowRadius = 1
        testUIView.layer.shadowColor = UIColor.brown.cgColor
//
        let contactShadowSize: CGFloat = 20
        let rect = CGRect(x: -contactShadowSize,
                          y: testUIView.frame.height - (contactShadowSize * 0.4),
                          width: testUIView.frame.width + contactShadowSize * 2,
                          height: contactShadowSize)
        testUIView.layer.shadowPath = UIBezierPath(ovalIn: rect).cgPath
        testUIView.layer.masksToBounds = false
        
        
        // CGPath
//        testUIView.layer.shadowOpacity = 1
//        testUIView.layer.shadowRadius = 5
//        testUIView.layer.shadowColor = UIColor.orange.cgColor
//        let contactShadowSize: CGFloat = 20
//        let shadowPath = CGPath(ellipseIn: CGRect(x: -contactShadowSize,
//                                                  y: testUIView.bounds.height - (contactShadowSize * 0.4),
//                                                  width: testUIView.bounds.width + contactShadowSize * 2,
//                                                  height: contactShadowSize),
//                                transform: nil)
//        testUIView.layer.shadowPath = shadowPath
        

    }
}
