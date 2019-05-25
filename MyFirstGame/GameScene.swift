//
//  GameScene.swift
//  testFireworks
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 18/05/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene {
    
    
    let label = SKLabelNode(text: "Happy Birthday")
    let particle = SKEmitterNode(fileNamed: "MyParticle2")!
    var backgroundSound = SKAudioNode(fileNamed: "Fireworks-2")
    
    override func didMove(to view: SKView) {

        addChild(label)
        
        addChild(backgroundSound)
        
        label.position = CGPoint(x: view.frame.width / 2 , y: view.frame.height / 2)
        label.fontSize = 50
        label.fontColor = SKColor.yellow
        label.fontName = "Avenir"
        
        
        
        self.loadStarField()
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(tap1))
        view.addGestureRecognizer(recognizer1)
      
//        let fireworksSound = SKAction.playSoundFileNamed("Fireworks-2", waitForCompletion: false)
//        self.run(fireworksSound)
//        
    }
    
    @objc func tap1(recognizer1: UITapGestureRecognizer) {
        //        let viewLocation = recognizer.location(in: view)
        //        let sceneLocation = convertPoint(fromView: viewLocation)
        //        let moveByAction = SKAction.moveBy(x: sceneLocation.x - label.position.x, y: sceneLocation.y - label.position.y, duration: 1)
        //       // label.run(moveByAction)
        //
        //        let moveByReverseAction = moveByAction.reversed()
        //        let moveByactions = [moveByAction, moveByReverseAction]
        //        let moveSequence = SKAction.sequence(moveByactions)
        //      //  let moveRepeatSequence = SKAction.repeat(moveSequence, count: 3)
        //        let moveForeverSequence = SKAction.repeatForever(moveSequence)
        //
        //        let scale = SKAction.scale(to: 0.5, duration: 1)
        //
        //        label.run(scale)
        
        
        let viewLocation = recognizer1.location(in: self.view)
        let sceneLocation = convertPoint(fromView: viewLocation)
        
        //        if atPoint(sceneLocation) == label {
        //            let scale = SKAction.scale(to: 0.5, duration: 1)
        //            label.run(scale)
        
        //        if label.contains(sceneLocation) {
        //            let scale = SKAction.scale(to: 0.5, duration: 1)
        //            label.run(scale)
        
        
//        let sceneNodes = nodes(at: sceneLocation)
        
//        for sceneNode in sceneNodes {
            //            if sceneNode == label {
            //                let scale = SKAction.scale(to: 0.5, duration: 1)
            //            let scale = SKAction.scaleX(to: 0.5, duration: 1)
            //                let scale = SKAction.scaleY(to: 2, duration: 1)
            //                let scale = SKAction.scaleX(to: 0.5, y: 2, duration: 1)
            //                label.run(scale)
            
            //let scale = SKAction.scale(by: 0.5, duration: 1)
            
            //            let scale = SKAction.scaleX(by: 0.5, y: 2, duration: 1)
            //            let reverseScale = scale.reversed()
            //            let actions = [scale, reverseScale]
            //            let sequence = SKAction.sequence(actions)
            //            //let repeatSequence = SKAction.repeat(sequence, count: 5)
            //            let repeatSequence = SKAction.repeatForever(sequence)
            //            label.run(repeatSequence)
            //
            
//            let move = SKAction.move(to: sceneLocation, duration: 1)
            //            let scale = SKAction.scaleX(to: 0.5, y: 2, duration: 1)
//            let scale = SKAction.scaleX(by: 0.5, y: 2, duration: 1)
//            let actions = [move, scale]
//            let sequence = SKAction.sequence(actions)
//            label.run(sequence)
//            break
//        }
        
        //        let particleNodes = nodes(at: sceneLocation)
        //
        //        for sceneNode in sceneNodes {
        //            let moveParticle = SKAction.moveBy(x: CGFloat.random(in: 0...100), y: CGFloat.random(in: 0...100), duration: 1)
        //            let actionsParticle = [moveParticle]
        //            let sequenceParticle = SKAction.sequence(actionsParticle)
        //            particle.run(sequenceParticle)
        //            break
        
//        let fireworksSoundStop = SKAction.stop()
//        self.run(fireworksSoundStop)
//        break
//        }
//        let startTransition = SKTransition.push(with: .right, duration: 3)
//        let stopSound = SKAction.pause()
//        let sequence = SKAction.sequence([stopSound, startTransition])
//        backgroundSound.run(sequence)
////        break
//        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let stopSound = SKAction.pause()
        backgroundSound.run(stopSound)
        
    }
    func loadStarField() {
        
        let starField = SparksNode()
        self.addChild(starField)
        starField.beginSpawningStars()
        
    }
}


//    }



