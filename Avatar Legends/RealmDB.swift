//
//  RealmDB.swift
//  Avatar Legends
//
//  Created by Alfonso Pimentel on 8/28/21.
//

import Foundation
import RealmSwift

class SaveUserInfo: Object {
    @Persisted var username: String = ""
    @Persisted var password: String = ""
    convenience init(username: String, password: String) {
        self.init()
        self.username = username
        self.password = password
    }
}

func saveData(_ username: String, _ password: String) {
    let localRealm = try! Realm()
  
    // save new user information
    let userData = SaveUserInfo(username: username, password: password)
    try! localRealm.write {
        localRealm.add(userData)
    }
    
    // Get all tasks in the realm
    //let localRealm = try! Realm()
}

func findUser(_ username: String, _ password: String) -> String {
    let localRealm = try! Realm()
    
    let userData = localRealm.objects(SaveUserInfo.self)
    let test = "not a real return"
    return test
}
