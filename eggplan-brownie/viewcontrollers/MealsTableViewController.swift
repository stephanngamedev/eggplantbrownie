//
//  MealsTableViewController.swift
//  eggplan-brownie
//
//  Created by Stephann Vasconcelos on 9/20/15.
//  Copyright © 2015 Stepo Lab. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    var meals = [
        Meal(name: "Eggplant Browniew", happiness: 5),
        Meal(name: "Zucchinni Muffin", happiness: 3)
    ]
    
    func add( meal: Meal ){
        meals.append( meal )
        tableView.reloadData()
    }
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
}
