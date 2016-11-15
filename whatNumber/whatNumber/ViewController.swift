//
//  ViewController.swift
//  whatNumber
//
//  Created by Tadeusz Wyrzykowski on 03.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var correct = arc4random_uniform(5)
    
    @IBOutlet var message: UILabel!
    @IBOutlet var guessField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(correct)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkButton(_ sender: UIButton) {
        let guess = guessField.text
        let correctGuess = String(correct)
        guessField.text = ""
        
        if correctGuess == guess {
            print("Correct Answer, guess new number!")
            message.text = "Correct Answer, guess new number!"
            message.textColor = UIColor.green
            
            correct = arc4random_uniform(5)
            print(correct)
        } else {
            print("Wrong Answer, try again!")
            message.text = "Wrong Answer, try again!"
            message.textColor = UIColor.red
        }
    }


}

