//
//  ViewController.swift
//  SoundPlayer
//
//  Created by Adriano Alves on 5/3/17.
//  Copyright © 2017 Adriano Alves. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Mark: Properties 
    var player : AVAudioPlayer?
    // optional because if the player not available or not in use it will be nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: playGuitarSound , action for the guitar button
    @IBAction func playGuitarSound(_ sender: UIButton) {
        
        playSound(soundName: "guitar")

    }// end of playGuitarSound
    
    //MARK: playBubblesSound , action for the bubble sound buttom
    @IBAction func playBubblesSound(_ sender: UIButton) {
        playSound(soundName: "bubbles")
    }// end of playBubblesSound
    


    @IBAction func playSoundButton(_ sender: UIButton) {
        // get the name of the sound base on the button label
        
        if let name = sender.titleLabel?.text{
            playSound(soundName: name.lowercased())
            // lowercased() used because the title of the button its captalized
        }
        
    }
        
    //MARK: playSound , method to play sounds
    func playSound(soundName : String) {
        
        //let guitarSound = NSDataAsset(name: "guitar")
        let sound = NSDataAsset(name: soundName)

        
        // Request system to use the AVAudioSession
        // if system not allow your application to play sound it will trow a error
        // use do , try and catch block
        //MARK: do , try and catch to check if AVAudioSession is available
        // if not available it will trow a error and return will be used to stop the method
        do {
            // get the category you need to use
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            // active
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            // here your error message
            print("😔 AVAudioSession not available!")
            // if not available do not continue , use return
            return
        }
        
        
        //MARK: do, try and catch to init the player
        do {
            player = try AVAudioPlayer(data: sound!.data)
            player?.play()
        } catch  {
            // here error msg for the player
            print("☹️ can't play the sound \(soundName)!")
        }
        
    }

}// end of ViewController

