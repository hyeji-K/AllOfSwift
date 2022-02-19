//
//  ViewController.swift
//  World Tracking
//
//  Created by heyji on 2022/02/17.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }

    @IBAction func add(_ sender: Any) {
////        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
////        let pyramid = SCNNode(geometry: SCNPlane(width: 0.3, height: 0.3))
//        let cylinder = SCNNode(geometry: SCNCylinder(radius: 0.1, height: 0.15))
//        cylinder.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        cylinder.position = SCNVector3(0, 0, -0.3)
//        // rotation y
//        cylinder.eulerAngles = SCNVector3(0, 0, Float(90.degreesToRadians))
//        self.sceneView.scene.rootNode.addChildNode(cylinder)
//
//        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
//        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        pyramid.position = SCNVector3(0, 0, -0.5)
//        cylinder.addChildNode(pyramid)
        let node = SCNNode()
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        node.eulerAngles = SCNVector3(Float(90.degreesToRadians), 0, 0)
        node.position = SCNVector3(0.2, 0.3, -0.2)
        node.eulerAngles = SCNVector3(Float(180.degreesToRadians), 0, 0)
        self.sceneView.scene.rootNode.addChildNode(node)
        
        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        boxNode.position = SCNVector3(0, -0.05, 0)
        node.addChildNode(boxNode)
        
        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        doorNode.position = SCNVector3(0, -0.2, 0.053)
        boxNode.addChildNode(doorNode)
        
        
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}
