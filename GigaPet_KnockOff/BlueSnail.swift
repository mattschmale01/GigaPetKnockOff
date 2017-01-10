//
//  BlueSnail.swift
//  GigaPet_KnockOff
//
//  Created by Matthew Schmale on 3/3/16.
//  Copyright © 2016 Schmale. All rights reserved.
//

import Foundation
import UIKit

class BlueSnail: MonsterImg{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder adecoder:NSCoder){
        super.init(coder: adecoder)
        playIdleAnimation()
    }
        
    
    override func playIdleAnimation() {
        self.image = UIImage(named: "blueIdle1")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var i = 1; i <= 4; i++ {
            
            let img = UIImage(named: "blueIdle\(i)")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    
    override func playDeathAnimation() {
        self.image = UIImage(named: "blueDead1")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var i = 1; i <= 3; i++ {
            let img = UIImage(named: "blueDead\(i)")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    
    
}