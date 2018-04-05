//
//  ViewController.swift
//  Magic 8 ball
//
//  Created by Ben Alima on 03/04/2018.
//  Copyright © 2018 RedRoseCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let answerArry = ["ball1", "ball2", "ball3", "ball4", "ball5"] //Arry that include the names of answer ball images
    var randomAnswer: Int = 0 //variable for radom answer
    
    @IBOutlet weak var BallImageAnswer: UIImageView! //image of Ball Answer
    
    func randomizeAnswer(){//Randomize Answer and change the picture (Ask Me)
        randomAnswer = Int(arc4random_uniform(5))
        BallImageAnswer.image = UIImage(named: answerArry[randomAnswer])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {//ask me when device stop shaked.
        randomizeAnswer()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AskMeButton(_ sender: UIButton) { //Ask me button.
        randomizeAnswer()
    }
    
}

