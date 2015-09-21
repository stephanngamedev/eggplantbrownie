//
//  MealsTableViewController.swift
//  eggplan-brownie
//
//  Created by Stephann Vasconcelos on 9/20/15.
//  Copyright © 2015 Stepo Lab. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {
    var meals = [
        Meal(name: "Eggplant Browniew", happiness: 5),
        Meal(name: "Zucchinni Muffin", happiness: 3)
    ]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        return cell
    }
}
