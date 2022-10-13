//
//  ViewController.swift
//  Whack a jellyfish
//
//  Created by heyji on 2022/03/04.
//

import UIKit
import ARKit
import Each

class ViewController: UIViewController {

    @IBOutlet var play: UIButton!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    var timer = Each(1).seconds
    var countdown = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [SCNDebugOptions.showWorldOrigin, SCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }

    @IBAction func play(_ sender: Any) {
        self.setTimer()
        self.addNode()
        self.play.isEnabled = false
    }
    
    @IBAction func reset(_ sender: Any) {
        // 게임 재시작
        self.timer.stop()
        self.restoreTimer()
        self.play.isEnabled = true
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
    }
    
    func addNode() {
        let jellyFishScene = SCNScene(named: "art.scnassets/Jellyfish.scn")
        guard let jellyfishNode = jellyFishScene?.rootNode.childNode(withName: "Jellyfish", recursively: false) else { return }
        jellyfishNode.position = SCNVector3(randomNumbers(firstNum: -1, secondNum: 1), randomNumbers(firstNum: -0.5, secondNum: 0.5), randomNumbers(firstNum: -1, secondNum: 1))
        self.sceneView.scene.rootNode.addChildNode(jellyfishNode)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let sceneViewTappedOn = sender.view as! SCNView
        let touchCoordinates = sender.location(in: sceneViewTappedOn)
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates)
        if hitTest.isEmpty {
            print("didn't touch anything")
        } else {
            // 카운트다운이 끝나고 지면 더 이상 해파리 터치 못하도록
            if countdown > 0 {
                let results = hitTest.first!
                let node = results.node
                if node.animationKeys.isEmpty {
                    // scene transaction
                    SCNTransaction.begin()
                    self.animateNode(node: node)
                    SCNTransaction.completionBlock = {
                        node.removeFromParentNode()
                        self.addNode()
                        self.restoreTimer()
                    }
                    SCNTransaction.commit()
                }
            }
        }
    }
    
    func animateNode(node: SCNNode) {
        let spin = CABasicAnimation(keyPath: "position")
        spin.fromValue = node.presentation.position
        spin.toValue = SCNVector3(node.presentation.position.x - 0.2, node.presentation.position.y - 0.2, node.presentation.position.z - 0.2)
        spin.duration = 0.07
        spin.autoreverses = true
        spin.repeatCount = 5
        node.addAnimation(spin, forKey: "position")
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func setTimer() {
        self.timer.perform { () -> NextStep in
            self.countdown -= 1
            self.timerLabel.text = String(self.countdown)
            // 카운트다운이 음수로 떨어지는 것 방지
            if self.countdown == 0 {
                self.timerLabel.text = "you lose"
                return .stop
            }
            return .continue
        }
    }
    
    // 해파리 터치시 타이머 재시작
    func restoreTimer() {
        self.countdown = 10
        self.timerLabel.text = String(self.countdown)
    }
}

