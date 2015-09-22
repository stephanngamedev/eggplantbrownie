//
//  Item.swift
//  eggplan-brownie
//
//  Created by Stephann Vasconcelos on 9/20/15.
//  Copyright © 2015 Stepo Lab. All rights reserved.
//

import Foundation

class Item: Equatable {
    let name: String
    let calories: Double
    
    init( name: String, calories: Double ){
        self.name = name
        self.calories = calories
    }
    
    
}

func ==( first:Item, second:Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}