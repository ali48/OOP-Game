//
//  ViewController.swift
//  OOP-Game
//
//  Created by Muhammad Ali on 2016-03-03.
//  Copyright © 2016 Muhammad Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    @IBOutlet weak var infoLbl: UILabel!

    @IBOutlet weak var playerHpLbl: UILabel!

    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        infoLbl.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            infoLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        }else{
            infoLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            infoLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       player = Player(name: "Mozilla91", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
        
        
    }

    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        }else{
            enemy = Vader(startingHp: 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
    }
    
    
    
    
    
    
    
}

