//
//  ViewController.swift
//  PickAFruit
//
//  Created by Tadeusz Wyrzykowski on 03.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    var fruits = ["Pick a fruit", "Apples", "Oranges", "Lemons", "Limes", "Blueberries"]
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = #imageLiteral(resourceName: "fruits")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruits.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruits[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let fruitSelected = fruits[row]
        
        switch fruitSelected {
        case "Apples":
            imageView.image = #imageLiteral(resourceName: "apples")
            infoLabel.text = "These Apples are red"
            infoLabel.textColor = UIColor.red
        case "Oranges":
            imageView.image = #imageLiteral(resourceName: "oranges")
            infoLabel.text = "These Oranges are orange"
            infoLabel.textColor = UIColor.orange
        case "Lemons":
            imageView.image = #imageLiteral(resourceName: "lemons")
            infoLabel.text = "These Lemons are yellow"
            infoLabel.textColor = UIColor.orange
        case "Limes":
            imageView.image = #imageLiteral(resourceName: "limes")
            infoLabel.text = "These Limes are green"
            infoLabel.textColor = UIColor.green
        case "Blueberries":
            imageView.image = #imageLiteral(resourceName: "blueberries")
            infoLabel.text = "These Blueberries are blue"
            infoLabel.textColor = UIColor.blue
        default:
            imageView.image = #imageLiteral(resourceName: "fruits")
            infoLabel.text = ""
        }
    }

}

