//
//  ViewController.swift
//  SayHello
//
//  Created by Tadeusz Wyrzykowski on 01.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let nameEntered = nameField.text
        messageLabel.text = "Hi there, \(nameEntered!)"
        
        nameField.text = ""
        nameField.resignFirstResponder()
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

