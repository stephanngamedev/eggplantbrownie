//
//  ViewController.swift
//  eggplan-brownie
//
//  Created by Stephann Vasconcelos on 9/19/15.
//  Copyright © 2015 Stepo Lab. All rights reserved.
//

import UIKit

protocol AddAMealDelegate {
    func add( meal: Meal )
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    
    var delegate: AddAMealDelegate?
    var items = [
        Item(name: "Eggplant Brownie", calories: 10),
        Item(name: "Zuccini Muffin", calories: 10),
        Item(name: "Cookie", calories: 10),
        Item(name: "Coconut oil", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000)
    ]
    
    var selectedItems = Array<Item>()
    
    @IBAction func add(){
        if nameField == nil || happinessField == nil {
            return
        }

        let name = nameField.text!
        let happiness = Int( happinessField.text! )
        
        if happiness == nil {
            return
        }
        
        let meal = Meal( name: name, happiness: happiness! )
        meal.items = selectedItems
        print( meal.items )
        if delegate == nil {
            return
        }
        
        delegate!.add( meal )
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated( true )
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let cell = tableView.cellForRowAtIndexPath( indexPath )
        
        if cell == nil {
            return nil
        }
        
        if cell!.accessoryType == UITableViewCellAccessoryType.None {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedItems.append( items[indexPath.row] )
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
            if let position = selectedItems.indexOf( items[indexPath.row]) {
                selectedItems.removeAtIndex( position )
            }
        }
        
        cell!.selected = false

        return nil
    }
}

