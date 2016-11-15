//
//  ViewController.swift
//  WorldCapitals
//
//  Created by Tadeusz Wyrzykowski on 03.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var labelOne: UILabel!
    
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var labelTwo: UILabel!

    @IBOutlet var message: UILabel!
    
    var data = [["Pick a Flag", "USA", "Italy", "China", "England"], ["Pick a Capital", "Bejing", "Rome", "Washington, DC", "London"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageOne.image = nil
        imageTwo.image = nil
        
        labelOne.text = ""
        labelTwo.text = ""
        
        message.text = "Match the Flags to the Capitals."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let itemOne = data[0][pickerView.selectedRow(inComponent: 0)]
        let itemTwo = data[1][pickerView.selectedRow(inComponent: 1)]
        
        let correctMessage = "The Capital of \(itemOne) is \(itemTwo)."
        let messageDefault = "Match the Flags to the Capitals."
    
        switch itemOne {
        case "USA":
            imageOne.image = #imageLiteral(resourceName: "usa")
            labelOne.text = itemOne
        case "Italy":
            imageOne.image = #imageLiteral(resourceName: "italy")
            labelOne.text = itemOne
        case "China":
            imageOne.image = #imageLiteral(resourceName: "china")
            labelOne.text = itemOne
        case "England":
            imageOne.image = #imageLiteral(resourceName: "england")
            labelOne.text = itemOne
        default:
            imageOne.image = nil
            labelOne.text = ""
        }
        
        var matched: Bool = false
        
        switch itemTwo {
        case "Bejing":
            imageTwo.image = #imageLiteral(resourceName: "beijing")
            labelTwo.text = itemTwo
            
            if itemOne == "China" {
                matched = true
            }
        case "Rome":
            imageTwo.image = #imageLiteral(resourceName: "rome")
            labelTwo.text = itemTwo
            
            if itemOne == "Italy" {
                matched = true
            }
        case "London":
            imageTwo.image = #imageLiteral(resourceName: "london")
            labelTwo.text = itemTwo
            
            if itemOne == "England" {
                matched = true
            }
        case "Washington, DC":
            imageTwo.image = #imageLiteral(resourceName: "washington")
            labelTwo.text = itemTwo
            
            if itemOne == "USA" {
                matched = true
            }
        default:
            imageTwo.image = nil
            labelTwo.text = ""
        }
        
        if matched {
            message.text = correctMessage
            message.textColor = UIColor.green
        } else {
            message.text = messageDefault
            message.textColor = UIColor.black
        }
    }

}

