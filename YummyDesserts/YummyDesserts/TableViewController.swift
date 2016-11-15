//
//  TableViewController.swift
//  YummyDesserts
//
//  Created by Tadeusz Wyrzykowski on 11.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var foodArray:[Food] = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);

        let food1 = Food(imageName: "cake", description: "Chocolate Cake", moreInfo: "Nothing better then chocolate!")
        let food2 = Food(imageName: "meringue", description: "Meringue & Berries", moreInfo: "I rly don't like meringue but it's a nice photo.")
        let food3 = Food(imageName: "peaches", description: "Grilled Peaches", moreInfo: "This would be a perfect as a summer time dessert.")
        let food4 = Food(imageName: "tiramisu", description: "Tiramisu", moreInfo: "One of my favourites!")
        
        foodArray.append(food1)
        foodArray.append(food2)
        foodArray.append(food3)
        foodArray.append(food4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomViewCell

        let foodItem = foodArray[indexPath.row]
        cell.imageView?.image = UIImage(named: foodItem.imageName)
        cell.textLabel?.text = foodItem.description

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodSelected = foodArray[indexPath.row]
        let detailedVC:DetailedViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        
        detailedVC.vImageView = foodSelected.imageName
        detailedVC.vDesc = foodSelected.moreInfo
        detailedVC.vLabel = foodSelected.description
        
        self.present(detailedVC, animated: true, completion: nil)
        
    }
    
    
}
