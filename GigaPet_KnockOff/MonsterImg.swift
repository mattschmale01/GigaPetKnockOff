//
//  MonsterImg.swift
//  GigaPet_KnockOff
//
//  Created by Matthew Schmale on 3/1/16.
//  Copyright © 2016 Schmale. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder adecoder: NSCoder){
        super.init(coder: adecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation(){
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var i = 1; i <= 4; i++ {
            
            let img = UIImage(named: "idle\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playBlueIdleAnimation(){
        self.image = UIImage(named: "blueIdle1.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var i = 1; i <= 4; i++ {
            
            let img = UIImage(named: "blueIdle\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    
    func playDeathAnimation(){
        self.image = UIImage(named: "dead5.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var i = 1; i <= 5; i++ {
            
            let img = UIImage(named: "dead\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.7
        self.animationRepeatCount = 1
        self.startAnimating()
        
        
        
    }
    func playBlueDeathAnimation(){
        self.image = UIImage(named: "blueDead3.png")
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for var i = 1; i <= 3; i++ {
            
            let img = UIImage(named: "blueDead\(i).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.7
        self.animationRepeatCount = 1
        self.startAnimating()
        
        
        
    }
    
}