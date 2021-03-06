//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Anthony Zhao on 1/22/18.
//  Copyright © 2018 Anthony Zhao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var awesomeImage: UIImageView!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    var numberOfImages = 11
    var numberOfSounds = 4
    
    //code below executes when the app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func nonRepeatingNumber(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    func playSound(soundName: String) {
        //can we load a sound
        if let sound = NSDataAsset(name: soundName) {
            //check if sound.data is a sound file
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
        } else {
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages =
            ["You are fantastic!",
             "You are great!",
             "You are awesome!",
             "When the genius bar needs help, they call you!",
             "You brighten my day!"]
        
//        var newIndex = -1
        
        //show a message
        index = nonRepeatingNumber(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //show an image
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingNumber(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image" + "\(imageNumber)")
        
        //play a sound
        soundNumber = nonRepeatingNumber(lastNumber: soundNumber, maxValue: numberOfSounds)
        let soundName = "sound\(soundNumber)"
        playSound(soundName: soundName)
        }
        
        
        
    }
    
    
    
    
//        var randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
//
//
//
//        messageLabel.text = messages[randomIndex]
//
    
    
//        messageLabel.text = messages[index]
//        index += 1
//
//        if index == (messages.count) {
//            index = 0
    
        /*
        let message1 = "You Are Awesome"
        let message2 = "You Are Great"
        let message3 = "You Are Amazing"
        
        if messageLabel.text == message1 {
            messageLabel.text = message2
        } else if messageLabel.text == message2 {
            messageLabel.text = message3
        } else {
            messageLabel.text = message1
        }
         */
        
    
    
    
//}

