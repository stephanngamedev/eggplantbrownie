//
//  ViewController.swift
//  eggplan-brownie
//
//  Created by Stephann Vasconcelos on 9/19/15.
//  Copyright © 2015 Stepo Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    
    @IBAction func add(){
        if nameField == nil || happinessField == nil {
            return
        }

        let name = nameField.text!
        let happiness = Int( happinessField.text! )
        
        let meal = Meal( name: name, happiness: happiness! )
        
        print( "Eaten: \(meal.name) - \(meal.happiness)" )
    }
}

