//
//  InGameUser.swift
//  InGameUser
//
//  Created by Alfonso Pimentel on 10/2/21.
//

import Foundation
import RealmSwift

class InGameUser: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var level: Int = 0
    @Persisted var gold: Int = 0
    @Persisted var Avatar: Avatars?
    
    convenience init(name: String, level: Int, gold: Int, Avatar: Avatars) {
        self.init()
        self.name = name
        self.level = level
        self.gold = gold
        self.Avatar = Avatar
    }
    
}
