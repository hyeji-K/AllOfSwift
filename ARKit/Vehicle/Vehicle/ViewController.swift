//
//  ViewController.swift
//  Vehicle
//
//  Created by heyji on 2022/03/09.
//

import UIKit
import ARKit
import CoreMotion

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    let motionManager = CMMotionManager()
    var vehicle = SCNPhysicsVehicle()
    var orientation: CGFloat = 0
    var touched: Int = 0
    var accelerationValues = [UIAccelerationValue(0), UIAccelerationValue(0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.configuration.planeDetection = .horizontal
        self.sceneView.session.run(configuration)
        self.sceneView.delegate = self
//        let lavaNode = createLava()
//        self.sceneView.scene.rootNode.addChildNode(lavaNode)
        self.setUpAccelerometer()
        self.sceneView.showsStatistics = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.touched = true
        guard let _ = touches.first else { return }
        self.touched += touches.count
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.touched = false
        self.touched = 0
    }
    
    func createConcrete(planeAnchor: ARPlaneAnchor) -> SCNNode {
//        let lavaNode = SCNNode(geometry: SCNPlane(width: 1, height: 1))
        let concreteNode = SCNNode(geometry: SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z)))
        concreteNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "concrete")
        concreteNode.geometry?.firstMaterial?.isDoubleSided = true
        concreteNode.position = SCNVector3(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        concreteNode.eulerAngles = SCNVector3(90.degreesToRadians, 0, 0)
        let staticBody = SCNPhysicsBody.static()
        concreteNode.physicsBody = staticBody
        return concreteNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        let concreteNode = createConcrete(planeAnchor: planeAnchor)
        node.addChildNode(concreteNode)
        print("new flat surface detected, new ARPlaneAnchor added")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        print("updating floor's anchor...")
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
        let concreteNode = createConcrete(planeAnchor: planeAnchor)
        node.addChildNode(concreteNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard let _ = anchor as? ARPlaneAnchor else { return }
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
    }
    
    @IBAction func addCar(_ sender: Any) {
        guard let pointOfView = sceneView.pointOfView else { return }
        let transform = pointOfView.transform
        let orientation = SCNVector3(-transform.m31, -transform.m32, -transform.m33)
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let currentPositionOfCamera = orientation + location
        
        let scene = SCNScene(named: "Car-Scene.scn")
        let chassis = (scene?.rootNode.childNode(withName: "chassis", recursively: false))!
        let frontLeftWheel = chassis.childNode(withName: "frontLeftParent", recursively: false)!
        let frontRightWheel = chassis.childNode(withName: "frontRightParent", recursively: false)!
        let rearLeftWheel = chassis.childNode(withName: "rearLeftParent", recursively: false)!
        let rearRightWheel = chassis.childNode(withName: "rearRightParent", recursively: false)!
        
        let v_frontLeftWheel = SCNPhysicsVehicleWheel(node: frontLeftWheel)
        let v_frontRightWheel = SCNPhysicsVehicleWheel(node: frontRightWheel)
        let v_rearRightWheel = SCNPhysicsVehicleWheel(node: rearRightWheel)
        let v_rearLeftWheel = SCNPhysicsVehicleWheel(node: rearLeftWheel)
        
//        let box = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
//        box.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        chassis.position = currentPositionOfCamera
        let body = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: chassis, options: [SCNPhysicsShape.Option.keepAsCompound: true]))
        body.mass = 1
        chassis.physicsBody = body
        self.vehicle = SCNPhysicsVehicle(chassisBody: chassis.physicsBody!, wheels: [v_rearRightWheel, v_rearLeftWheel, v_frontRightWheel, v_frontLeftWheel])
        self.sceneView.scene.physicsWorld.addBehavior(self.vehicle)
        self.sceneView.scene.rootNode.addChildNode(chassis)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didSimulatePhysicsAtTime time: TimeInterval) {
//        print("simulationg physics")
        var engineForce: CGFloat = 0
        var brakingForce: CGFloat = 0
        self.vehicle.setSteeringAngle(-orientation, forWheelAt: 2)
        self.vehicle.setSteeringAngle(-orientation, forWheelAt: 3)
        if self.touched == 1 {
            engineForce = 5
        } else if self.touched == 2 {
            engineForce = -5
        } else if self.touched == 3 {
            brakingForce = 100
        }
        else {
            engineForce = 0
        }
        self.vehicle.applyEngineForce(engineForce, forWheelAt: 0)
        self.vehicle.applyEngineForce(engineForce, forWheelAt: 1)
        self.vehicle.applyBrakingForce(brakingForce, forWheelAt: 0)
        self.vehicle.applyBrakingForce(brakingForce, forWheelAt: 1)
    }
    
    func setUpAccelerometer() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 1/60
            motionManager.startAccelerometerUpdates(to: .main) { (accelerometerData, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
//                print("accelerometer is detecting acceleration")
                self.accelerometerDidChange(acceleration: accelerometerData!.acceleration)
            }
        } else {
            print("accelerometer not available")
        }
    }
    
    func accelerometerDidChange(acceleration: CMAcceleration) {
        
//        print(acceleration.x)
//        print(acceleration.y)
//        print("")
        accelerationValues[1] = filtered(currentAcceleration: accelerationValues[1], UpdatedAcceleration: acceleration.y)
        accelerationValues[0] = filtered(currentAcceleration: accelerationValues[0], UpdatedAcceleration: acceleration.x)
        if accelerationValues[0] > 0 {
            self.orientation = -CGFloat(accelerationValues[1])
        } else {
            self.orientation = CGFloat(accelerationValues[1])
        }
    }
    
    func filtered(currentAcceleration: Double, UpdatedAcceleration: Double) -> Double {
        let kfilteringFactor = 0.5
        return UpdatedAcceleration * kfilteringFactor + currentAcceleration * (1-kfilteringFactor)
    }
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
