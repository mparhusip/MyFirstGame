//
//  GameViewController.swift
//  testFireworks
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 18/05/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GameController

class GameViewController2: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)

//        let audio = SKAudioNode(fileNamed: "Fireworks-2")
//        scene.addChild(audio)
//        let audioStop = SKAction.stop()
//        scene.run(audioStop)
        
    }
    
    @objc func tap(recognizer: UITapGestureRecognizer) {

        performSegue(withIdentifier: "back_segue", sender: nil)
        


        }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
