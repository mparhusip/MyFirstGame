//
//  SparksNode.swift
//  MyFirstGame
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 24/05/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import SpriteKit
import QuartzCore
import CoreGraphics

class SparksNode: SKNode {

    private let baseAlpha: CGFloat = 0.1
    private let basedDuration: CGFloat = 0.5
    private let defaultDelay: TimeInterval = 0.03
    
    
    internal func beginSpawningStars() {
        
        let update = SKAction.run {
            [unowned self] in
            self.spawnStar()
        }
        
        let delay = SKAction.wait(forDuration: defaultDelay)
        let updateSequence = SKAction.sequence([delay, update])
        let repeatForever = SKAction.repeatForever(updateSequence)
        self.run(repeatForever)
    }
    
    
    private func spawnStar() {
        
        if let gameScene = self.scene{
            
            let randomPositionY = CGFloat.random(in: gameScene.frame.minY...gameScene.frame.maxY)
            let randomPositionX = CGFloat.random(in: gameScene.frame.minX...gameScene.frame.maxX)
            let spawnPoint = CGPoint(x: randomPositionX, y: randomPositionY)
            let sparkNode = SKEmitterNode(fileNamed: "MyParticle2")
            sparkNode?.position = spawnPoint
            sparkNode?.particleBirthRate = 1000
            sparkNode?.numParticlesToEmit = 50
            let randomRed = CGFloat.random(in: 0...1)
            let randomBlue = CGFloat.random(in: 0...1)
            let randomGreen = CGFloat.random(in: 0...1)
            let colorNode = UIColor(displayP3Red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
            sparkNode?.particleColor = colorNode
            self.addChild(sparkNode!)
            
            let duration = TimeInterval(basedDuration + CGFloat(arc4random_uniform(10) / 10))
            
            let travel = SKAction.moveBy(x: 0, y: 0, duration: duration)
            let remove = SKAction.removeFromParent()
            let sequence = SKAction.sequence([travel, remove])
            sparkNode?.run(sequence)
        }
        
        
    }
}
