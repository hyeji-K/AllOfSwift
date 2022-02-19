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
//        let cylinderNode = SCNNode(geometry: SCNCylinder(radius: 0.05, height: 0.05))
        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
//        cylinderNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        let node = SCNNode()
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
//        node.geometry = SCNCone(topRadius: 0.3, bottomRadius: 0.3, height: 0.3)
//        node.geometry = SCNCylinder(radius: 0.2, height: 0.2)
//        node.geometry = SCNSphere(radius: 0.1)
//        node.geometry = SCNTube(innerRadius: 0.2, outerRadius: 0.3, height: 0.5)
//        node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
//        node.geometry = SCNPlane(width: 0.2, height: 0.2)
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: -0.2, y: 0.2))
//        path.addLine(to: CGPoint(x: 0, y: 0.4))
//        path.addLine(to: CGPoint(x: 0, y: 0.7))
//        path.addLine(to: CGPoint(x: 0.2, y: 0.4))
//        path.addLine(to: CGPoint(x: 0.4, y: 0.4))
//        path.addLine(to: CGPoint(x: 0.6, y: 0.7))
//        path.addLine(to: CGPoint(x: 0.6, y: 0.4))
//        path.addLine(to: CGPoint(x: 0.8, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.6, y: 0))
//        let shape = SCNShape(path: path, extrusionDepth: 0.2)
//        node.geometry = shape
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(0.2, 0.3, -0.2)
//        cylinderNode.position = SCNVector3(-0.3, 0.2, -0.3)
        boxNode.position = SCNVector3(0, -0.05, 0)
        doorNode.position = SCNVector3(0, -0.02, 0.053)
        self.sceneView.scene.rootNode.addChildNode(node)
//        self.sceneView.scene.rootNode.addChildNode(cylinderNode)
//        node.addChildNode(cylinderNode)
        node.addChildNode(boxNode)
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

