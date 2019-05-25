//
//  GameViewController.swift
//  MyFirstGame
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 18/05/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    var geometry: SCNGeometry!


    
    let position = SCNVector3(x: 2, y: 3, z: 5)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupScene()
        setupCamera()
        spawnShape()
        
        let x = position.x
        let y = position.y
        let z = position.z
        
    
//        let boxRotate = scnScene.rootNode.childNode(withName: "geometry", recursively: true)!
//        boxRotate.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
//
        
//        let materialBox = SCNMaterialProperty.accessibilityAttributedLabel()
//        materialBox?.accessibilityLabel?.append("?")
//
//        print(materialBox)
//
        
        
//        let materialBox = geometry.firstMaterial
//        let materialBoxNode = scnScene.rootNode.childNode(withName: "material", recursively: true)
//
        
//        materialBox?.accessibilityLabel?.append("?")
//        SCNTransaction.commit()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        
        
        
    }
    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result = hitResults[0]
            
            // get its material
            let material = result.node.geometry!.firstMaterial!
            
            let materialNode = scnScene.rootNode.childNode(withName: "material", recursively: true)
            // highlight it
//            SCNTransaction.begin()
//            SCNTransaction.animationDuration = 0.5
//
//            // on completion - unhighlight
//            SCNTransaction.completionBlock = {
//                SCNTransaction.begin()
//                SCNTransaction.animationDuration = 0.5
//
//                material.emission.contents = UIColor.black
//
//                SCNTransaction.commit()
//            }
//
//            material.emission.contents = UIColor.red
//
//            SCNTransaction.commit()
//            let node = scnView.scene!.rootNode.childNode(withName: "Camera", recursively: false)
//            let zoomingIn = SCNAction.moveBy(x: scnView.frame.maxX, y: scnView.frame.maxY, z: 10, duration: 2)
////
//            let zoomInAction = SCNAction.scale(to: 15, duration: 1)
//            cameraNode.runAction(zoomInAction)
//
//            let moveBox = SCNAction.move(to: SCNVector3(x: 0, y: 0, z: 0), duration: 2)
//            let moveToOther = changedTransition()
//            let sequence = SCNAction.sequence([moveBox, moveToOther])
            
//            cameraNode.runAction(moveBox)
            
//            if scnView.preferredFramesPerSecond == 57 {
//
//                performSegue(withIdentifier: "transform_segue", sender: nil)
//
//            }
//
            performSegue(withIdentifier: "transform_segue", sender: nil)
            
            
            
            
        }

        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        
        
        return true
    }
    
    func setupView(){
        scnView = self.view as! SCNView
        scnView.showsStatistics = true
//        scnView.allowsCameraControl = true
        scnView.allowsCameraControl = false
        scnView.autoenablesDefaultLighting = true
    }
    
    func setupScene(){
        scnScene = SCNScene()
        scnView.scene = scnScene
        
    }

    func setupCamera(){
        cameraNode = SCNNode()
        cameraNode.name = "Camera"
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0 , z: 10)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func spawnShape(){
        
        
        switch ShapeType.random(){
        default:
            geometry = SCNBox(width: 2, height: 2, length: 2, chamferRadius: 0)
        }
        
        let color = randomColor()
        geometry.materials.first?.diffuse.contents = color
        
        let geometryNode = SCNNode(geometry: geometry)
    
//
        
//        [geometryNode .runAction(SCNAction .repeatForever(SCNAction .rotateBy(x: 0, y: 0, z: 2*M_PI, duration: 3)))]
        scnScene.rootNode.addChildNode(geometryNode)
//        let cameraBox = geometryNode.camera?.automaticallyAdjustsZRange
        
        let rotate = SCNAction.rotateBy(x: 3, y: 3, z: 10, duration: 5)
        let rotateForever = SCNAction.repeatForever(rotate)
        geometryNode.runAction(rotateForever)
        
    }
    
    
    
    func randomColor() -> UIColor{
        
        
        let randomRed = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        let color = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
        return color
    }
    
//    func changedTransition() -> SCNAction {
//            performSegue(withIdentifier: "transform_segue", sender: nil)
//        return changedTransition()
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         let moveBox = SCNAction.move(to: SCNVector3(x: 0, y: 0, z: 0), duration: 0.5)
        cameraNode.runAction(moveBox)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    

}


