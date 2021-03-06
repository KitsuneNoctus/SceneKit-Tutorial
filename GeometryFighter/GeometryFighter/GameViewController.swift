//
//  GameViewController.swift
//  GeometryFighter
//
//  Created by Henry Calderon on 11/25/20.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
        spawnShape()
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: Setup
    func setupView() {
        scnView = self.view as! SCNView
        
        // 1
        scnView.showsStatistics = true
        // 2
        scnView.allowsCameraControl = true
        // 3
        scnView.autoenablesDefaultLighting = true

    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView.scene = scnScene
//        scnScene.background.contents = "Background_Diffuse.jpg"
        scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.jpg"
    }
    
    func setupCamera() {
        // 1
        cameraNode = SCNNode()
        // 2
        cameraNode.camera = SCNCamera()
        // 3
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        // 4
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    //MARK: Spawn
    func spawnShape() {
        // 1
        var geometry:SCNGeometry
        // 2
        switch ShapeType.random() {
        default:
            // 3
            geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
            geometry.firstMaterial?.diffuse.contents = UIColor.blue
        }
        // 4
        let geometryNode = SCNNode(geometry: geometry)
        // 5
        geometryNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
        scnScene.rootNode.addChildNode(geometryNode)
    }
    
}
