//
//  ViewController.swift
//  AR-Hoops
//
//  Created by heyji on 2022/03/25.
//

import UIKit
import ARKit
import Each

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet var planeDetected: UILabel!
    let configuration = ARWorldTrackingConfiguration()
//    var basketAdded: Bool {
//        return self.sceneView.scene.rootNode.childNode(withName: "Basket", recursively: false) != nil
//    }
    var basketAdded: Bool = false
    var power: Float = 1
    var timer = Each(0.05).seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.configuration.planeDetection = .horizontal
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.cancelsTouchesInView = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.basketAdded == true {
            timer.perform(closure: { () -> NextStep in
                self.power = self.power + 1
                return .continue
            })
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.basketAdded == true {
            self.timer.stop()
            self.shootBall()
        }
        self.power = 1
    }
    
    func shootBall() {
        guard let pointOfView = self.sceneView.pointOfView else { return }
        self.removeEveryOtherBall()
//        self.power = 10
        let transform = pointOfView.transform
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let orientation = SCNVector3(-transform.m31, -transform.m32, -transform.m33)
        let position = location + orientation
        let ball = SCNNode(geometry: SCNSphere(radius: 0.25))
        ball.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "ball")
        ball.position = position
        let body = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: ball))
        ball.physicsBody = body
        ball.name = "BasketBall"
        body.restitution = 0.2
        ball.physicsBody?.applyForce(SCNVector3(orientation.x*power, orientation.y*power, orientation.z*power), asImpulse: true)
        self.sceneView.scene.rootNode.addChildNode(ball)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard let sceneView = sender.view as? ARSCNView else { return }
        let touchLocation = sender.location(in: sceneView)
        let hitTestResult = sceneView.hitTest(touchLocation, types: [.existingPlaneUsingExtent])
        if !hitTestResult.isEmpty {
            self.addBasket(hitTestResult: hitTestResult.first!)
        }
    }
    
    func addBasket(hitTestResult: ARHitTestResult) {
        if basketAdded == false {
            let basketScene = SCNScene(named: "Basketball.scnassets/Basketball.scn")
            let basketNode = basketScene?.rootNode.childNode(withName: "Basket", recursively: false)
            let positionOfPlane = hitTestResult.worldTransform.columns.3
            let xPosition = positionOfPlane.x
            let yPosition = positionOfPlane.y
            let zPosition = positionOfPlane.z
            basketNode?.position = SCNVector3(xPosition, yPosition, zPosition)
            basketNode?.physicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(node: basketNode!, options: [SCNPhysicsShape.Option.keepAsCompound: true, SCNPhysicsShape.Option.type: SCNPhysicsShape.ShapeType.concavePolyhedron]))
            self.sceneView.scene.rootNode.addChildNode(basketNode!)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.basketAdded = true
            }
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else { return }
        DispatchQueue.main.async {
            self.planeDetected.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.planeDetected.isHidden = true
        }
    }
    
    func removeEveryOtherBall() {
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            if node.name == "BasketBall" {
                node.removeFromParentNode()
            }
        }
    }
    
    deinit {
        self.timer.stop()
    }
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
