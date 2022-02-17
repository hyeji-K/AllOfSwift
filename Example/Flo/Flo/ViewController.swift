//
//  ViewController.swift
//  Flo
//
//  Created by heyji on 2022/01/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = String(counterView.counter)

        
    }

    
    @IBAction func pushButtonPressed(_ button: PushButton) {
      if button.isAddButton {
        counterView.counter += 1
      } else {
        if counterView.counter > 0 {
          counterView.counter -= 1
        }
      }
      counterLabel.text = String(counterView.counter)
    }


}

