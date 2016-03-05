//
//  Vader.swift
//  OOP-Game
//
//  Created by Muhammad Ali on 2016-03-04.
//  Copyright © 2016 Muhammad Ali. All rights reserved.
//

import Foundation


class Vader: Enemy {
    
    let IMMUNE_MAX = 20
    
    override var type: String {
        return "Darth Vader"
    }
    
    override var loot: [String] {
        return ["Sith Holocron", "Vader's Lightsaber", "Death Star Blueprints"]
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        }else {
            return false
        }
        
    }
    
}