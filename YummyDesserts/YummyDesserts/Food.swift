//
//  Food.swift
//  YummyDesserts
//
//  Created by Tadeusz Wyrzykowski on 11.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import Foundation

class Food {
    
    var imageName = ""
    var description = ""
    var moreInfo = ""
    
    init(imageName: String, description: String, moreInfo: String) {
        self.imageName = imageName
        self.description = description
        self.moreInfo = moreInfo
    }
    
}
