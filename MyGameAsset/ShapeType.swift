//
//  ShapeType.swift
//  MyFirstGame
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 18/05/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import Foundation

enum ShapeType:Int {
    
    case box = 0
    case tube
    case sphere
    case pyramid
    case torus
    case capsule
    case cylinder
    case cone
    
    
    static func random() -> ShapeType{
        let maxValue = tube.rawValue
        let rand = arc4random_uniform(UInt32(maxValue+1))
        return ShapeType(rawValue: Int(rand))!
    }
}
