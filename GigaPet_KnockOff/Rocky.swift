//
//  Rocky.swift
//  GigaPet_KnockOff
//
//  Created by Matthew Schmale on 3/3/16.
//  Copyright © 2016 Schmale. All rights reserved.
//

import Foundation
import UIKit

class Rocky: MonsterImg{
    override func playIdleAnimation() {
        super.playIdleAnimation()
    }
    
    override func playDeathAnimation() {
        super.playDeathAnimation()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder adecoder: NSCoder){
        super.init(coder: adecoder)
        playIdleAnimation()
    }
}