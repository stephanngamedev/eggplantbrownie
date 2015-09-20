//
//  Meal.swift
//  eggplan-brownie
//
//  Created by Stephann Vasconcelos on 9/19/15.
//  Copyright © 2015 Stepo Lab. All rights reserved.
//

import Foundation

class Meal {
    let name: String
    let happiness: Int
    var items = Array<Item>()
    
    init( name: String, happiness: Int ){
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        
        for item in items {
            total += item.calories
        }
        
        return total
    }
}