//
//  VC2.swift
//  PassedData
//
//  Created by Tadeusz Wyrzykowski on 11.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet var label: UILabel!
    
    var outputMessage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = outputMessage
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
