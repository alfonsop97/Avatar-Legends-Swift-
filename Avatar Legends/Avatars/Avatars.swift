//
//  Avatars.swift
//  Avatars
//
//  Created by Alfonso Pimentel on 9/30/21.
//

import Foundation
import RealmSwift

class Avatars: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var type: String = ""
    @Persisted var health: Int = 0
    @Persisted var defense: Int = 0
    @Persisted var specialDefense: Int = 0
    @Persisted var attackDamage: Int = 0
    @Persisted var abilityPower: Int = 0
    @Persisted var speed: Int = 0
    
    @Persisted var itemHandEquipped: Bool
    @Persisted var itemBodyEquipped: Bool
    @Persisted var itemHelmetEquipped: Bool
    @Persisted var itemPantsEquipped: Bool
    
    convenience init(name: String, type: String, health: Int, defense: Int,
                     specialDefense: Int, attackDamage: Int, abilityPower: Int, speed: Int) {
        self.init()
        self.name = name
        self.type = type
        self.health = health
        self.defense = defense
        self.specialDefense = specialDefense
        self.attackDamage = attackDamage
        self.abilityPower = abilityPower
        self.speed = speed
    }
}

func avatarsInRealm() {
    
    //func to create avatars in realm
    
    let avatars = "avatars"
    var config = Realm.Configuration.defaultConfiguration
    config.fileURL!.deleteLastPathComponent()
    config.fileURL!.appendPathComponent(avatars)
    config.fileURL!.appendPathExtension("realm")
    let localRealm = try! Realm(configuration: config)
    //let localRealm = try! Realm()
    print(Realm.Configuration.defaultConfiguration.fileURL)
    
    

}
