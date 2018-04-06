//
//  ViewController.swift
//  MyXylophone
//
//  Created by Ben Alima on 06/04/2018.
//  Copyright © 2018 RedRoseCo. All rights reserved.
//

import UIKit
import AVFoundation  //Library of Audio and Video

class ViewController: UIViewController, AVAudioPlayerDelegate { //AvAudioPlayerDelegate allows a delegate to respond to audio interruptions and audio decoding errors, and to the completion of a sound’s playback
    
    var audioPlayer = AVAudioPlayer() //define the variable as audioplayer

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        let noteSound = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav") //Create URL of the Sound file location
        do { //Settig up the sound file
            audioPlayer = try AVAudioPlayer(contentsOf: noteSound!)
        } catch { //if there is a problem is printing the message
            print(error)
        }
       audioPlayer.play() //playing the sound
    }
}


