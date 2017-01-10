//
//  ViewController.swift
//  GigaPet_KnockOff
//
//  Created by Matthew Schmale on 3/1/16.
//  Copyright © 2016 Schmale. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var monsterImage: MonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    
    @IBOutlet weak var penalty1: UIImageView!
    @IBOutlet weak var penalty2: UIImageView!
    @IBOutlet weak var penalty3: UIImageView!
    @IBOutlet weak var livesPannel: UIImageView!
    
    @IBOutlet weak var blueSnail: UIButton!
    @IBOutlet weak var rocky: UIButton!
    @IBOutlet weak var selectAMonsterLabel: UILabel!
    
    var isClassicMonster: Bool!
    
    @IBAction func onBlueSnailBtnPress(sender: AnyObject) {
        monsterImage.image = UIImage(named: "blueIdle1")
        monsterImage.playBlueIdleAnimation()
        monsterImage.hidden = false
        
        foodImg.hidden = false
        heartImg.hidden = false
        penalty1.hidden = false
        penalty2.hidden = false
        penalty3.hidden = false
        livesPannel.hidden = false
        
        selectAMonsterLabel.hidden = true
        blueSnail.enabled = false
        blueSnail.hidden = true
        rocky.enabled = false
        rocky.hidden = true
        
        isClassicMonster = false
        startTimer()
    }
    
    @IBAction func onRockyBtnPress(sender: AnyObject) {
        monsterImage.image = UIImage(named: "idle1")
        monsterImage.playIdleAnimation()
        
        foodImg.hidden = false
        heartImg.hidden = false
        penalty1.hidden = false
        penalty2.hidden = false
        penalty3.hidden = false
        livesPannel.hidden = false
        
        selectAMonsterLabel.hidden = true
        blueSnail.enabled = false
        blueSnail.hidden = true
        rocky.enabled = false
        rocky.hidden = true
        
        isClassicMonster = true
        startTimer()

    }
    
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    var sfxDie: AVAudioPlayer!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    var monsterHappy = false
    var currentItem:UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImage
        heartImg.dropTarget = monsterImage
        
        foodImg.hidden = true
        heartImg.hidden = true
        penalty1.hidden = true
        penalty2.hidden = true
        penalty3.hidden = true
        livesPannel.hidden = true
        
        penalty1.alpha = DIM_ALPHA
        penalty2.alpha = DIM_ALPHA
        penalty3.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemsDroppedOnCharacter:", name: "onTargetDropped", object: nil)
       
        do {
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            try sfxDie = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            
        
        } catch let err as NSError {
            print(err.debugDescription)
        }
            
        musicPlayer.prepareToPlay()
        musicPlayer.play()
        
        sfxBite.prepareToPlay()
        sfxHeart.prepareToPlay()
        sfxSkull.prepareToPlay()
        sfxDie.prepareToPlay()
        
       
        
    }
    func itemsDroppedOnCharacter(notif: AnyObject){
        monsterHappy = true
        startTimer()
        
        foodImg.alpha = DIM_ALPHA
        heartImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.userInteractionEnabled = false
        
        if currentItem == 0 {
            sfxHeart.play()
        } else {
            sfxBite.play()
        }
        
    }
    func startTimer(){
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
    }
    
    func changeGameState(){
      
        if !monsterHappy{
            penalties++
            sfxSkull.play()
            
            if penalties == 1 {
                penalty1.alpha = OPAQUE
                penalty2.alpha = DIM_ALPHA
            } else if penalties == 2 {
                penalty2.alpha = OPAQUE
                penalty3.alpha = DIM_ALPHA
            } else if penalties >= 3 {
                penalty3.alpha = OPAQUE
            } else {
                penalty1.alpha = DIM_ALPHA
                penalty2.alpha = DIM_ALPHA
                penalty3.alpha = DIM_ALPHA
            }
            
            if penalties >= MAX_PENALTIES{
                gameOver()
            }
        }
        
        let rand = arc4random_uniform(2)  // 0 or 1
        if rand == 0 {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
        } else {
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
        }
        
        currentItem = rand
        monsterHappy = false
        
    }
    
    func gameOver(){
        timer.invalidate()
        musicPlayer.stop()
        if isClassicMonster == true {
            monsterImage.playDeathAnimation()
        } else {
            monsterImage.playBlueDeathAnimation()
        }
        sfxDie.play()
    }

}

