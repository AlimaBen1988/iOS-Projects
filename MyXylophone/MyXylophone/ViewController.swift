//
//  ViewController.swift
//  MyXylophone
//
//  Created by Ben Alima on 06/04/2018.
//  Copyright © 2018 RedRoseCo. All rights reserved.
//

import UIKit
import AVFoundation  //Library of Audio and Video

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        let noteSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "note\(sender.tag)", ofType: "wav")!) //Configure the Sound file
        do { //settig up the sound file
            audioPlayer = try AVAudioPlayer(contentsOf: noteSound as URL)
        } catch { //if there is a problem is printing the message
            print("Problem in getting File")
        }
       audioPlayer.play() //playing the sound
    }
}


