//
//  DetailedViewController.swift
//  YummyDesserts
//
//  Created by Tadeusz Wyrzykowski on 11.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var desc: UILabel!
    
    var vImageView = ""
    var vLabel = ""
    var vDesc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: vImageView)
        label.text = vLabel
        desc.text = vDesc
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
