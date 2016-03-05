//
//  Enemy.swift
//  OOP-Game
//
//  Created by Muhammad Ali on 2016-03-04.
//  Copyright © 2016 Muhammad Ali. All rights reserved.
//

import Foundation


class Enemy: Character {
    var loot: [String] {
        return ["Rusty Sword", "Diamond Necklace", "Broken Spell Book"]
    }
    
    var type: String {
        return "Grumpy Troll"
    }
    
    func dropLoot() ->String? {
        if !isAlive {
            let random = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[random]
        }
        
        return nil
    }
    
    
}