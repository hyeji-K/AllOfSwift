//
//  ViewController.swift
//  Planets
//
//  Created by heyji on 2022/02/23.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [SCNDebugOptions.showFeaturePoints, SCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let sun = planet(geometry: SCNSphere(radius: 0.35), diffuse: "Sun diffuse", specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -1))
        let earthParent = SCNNode()
        let venusParent = SCNNode()
        earthParent.position = SCNVector3(0, 0, -1)
        venusParent.position = SCNVector3(0, 0, -1)
        self.sceneView.scene.rootNode.addChildNode(sun)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)

        let earth = planet(geometry: SCNSphere(radius: 0.2), diffuse: "Earth day", specular: "Earth Specular", emission: "Earth Emission", normal: "Earth Normal", position: SCNVector3(1.2, 0, 0))
        earthParent.addChildNode(earth)
        
        let venus = planet(geometry: SCNSphere(radius: 0.1), diffuse: "Venus Surface", specular: nil, emission: "Venus Atmosphere", normal: nil, position: SCNVector3(0.7, 0, 0))
        venusParent.addChildNode(venus)
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let forever = SCNAction.repeatForever(action)
        sun.runAction(forever)
        
        let earthParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 14)
        let venusParentRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10)
        
        let foreverEarth = SCNAction.repeatForever(earthParentRotation)
        let foreverVenus = SCNAction.repeatForever(venusParentRotation)
        earthParent.runAction(foreverEarth)
        venusParent.runAction(foreverVenus)
        
        let moon = planet(geometry: SCNSphere(radius: 0.05), diffuse: "Moon diffuse", specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -0.3))
        let venusMoon = planet(geometry: SCNSphere(radius: 0.05), diffuse: "Moon diffuse", specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -0.3))
        earth.addChildNode(moon)
        venus.addChildNode(venusMoon)
        let earthRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let venusRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let foreverEarthRotation = SCNAction.repeatForever(earthRotation)
        let foreverVenusRotation = SCNAction.repeatForever(venusRotation)
        earth.runAction(foreverEarthRotation)
        venus.runAction(foreverVenusRotation)
    }
    
    func planet(geometry: SCNGeometry, diffuse: String, specular: String?, emission: String?, normal: String?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = UIImage(named: diffuse)
        planet.geometry?.firstMaterial?.specular.contents = UIImage(named: specular ?? "")
        planet.geometry?.firstMaterial?.emission.contents = UIImage(named: emission ?? "")
        planet.geometry?.firstMaterial?.normal.contents = UIImage(named: normal ?? "")
        planet.position = position
        return planet
    }
    
    func Rotation(time: TimeInterval) -> SCNAction {
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: time)
        let foreverRotation = SCNAction.repeatForever(rotation)
        return foreverRotation
    }


}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}

