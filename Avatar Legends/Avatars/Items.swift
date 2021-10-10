//
//  Items.swift
//  Items
//
//  Created by Alfonso Pimentel on 10/2/21.
//

import Foundation
import RealmSwift

class Items: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var attackDamage: Int = 0
    @Persisted var abilityPower : Int = 0
    @Persisted var defense: Int = 0
    @Persisted var specialDefense: Int = 0
    @Persisted var health: Int = 0
    @Persisted var speed: Int = 0
    @Persisted var criticalDamage: Int = 0

    convenience init(name: String, health: Int, defense: Int, specialDefense: Int,
                     attackDamage: Int, abilityPower: Int,  speed: Int) {
        self.init()
        self.name = name
        self.health = health
        self.defense = defense
        self.specialDefense = specialDefense
        self.attackDamage = attackDamage
        self.abilityPower = abilityPower
        self.speed = speed
    
    }
}

func itemListRealm() {
    
    //func to create item realm
    
    let itemList = "item"
    var config = Realm.Configuration.defaultConfiguration
    config.fileURL!.deleteLastPathComponent()
    config.fileURL!.appendPathComponent(itemList)
    config.fileURL!.appendPathExtension("realm")
    let localRealm = try! Realm(configuration: config)
    //let localRealm = try! Realm()
    print(Realm.Configuration.defaultConfiguration.fileURL)
    
    

}
