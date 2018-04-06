//
//  ViewController.swift
//  DiceRoll
//
//  Created by Ben Alima on 02/04/2018.
//  Copyright © 2018 RedRoseCo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer = AVAudioPlayer() //audio player for sound
    let noteSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "shakeRollDice", ofType: "wav")!) //Create URL of the Sound file location
    
    var randomRightDice : Int = 0 // variable for random rigth dice
    var randomLeftDice : Int = 0 // variable for random rigth dice
    let diceArry = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"] //array that include the names of dices pic
    
    func randomizeDicesImages() { //randomize the dices and change UIImage of the dices (Roll Dices)
        randomLeftDice = Int(arc4random_uniform(6)) //random the left dice
        randomRightDice = Int(arc4random_uniform(6)) //random the right dice
        
        rightDiceImage.image = UIImage(named: diceArry[randomRightDice]) //change the right dice image
        leftDiceImage.image = UIImage(named: diceArry[randomLeftDice]) //change the left dice image
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) { //when device end shaked the dices rolls
        randomizeDicesImages()
    }
    
    @IBOutlet weak var rightDiceImage: UIImageView!
    @IBOutlet weak var leftDiceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomizeDicesImages() //roll the dices when the app loading
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rollButton(_ sender: UIButton) {
        do { //Settig up the sound file
            audioPlayer = try AVAudioPlayer(contentsOf: noteSound as URL)
        } catch { //if there is a problem is printing the message
            print("Problem in getting File")
        }
        audioPlayer.play()
        randomizeDicesImages() //roll the dices when press on ROLL button
    }
    

}

