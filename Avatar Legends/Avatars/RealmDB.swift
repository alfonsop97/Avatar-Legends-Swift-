//
//  RealmDB.swift
//  Avatar Legends
//
//  Created by Alfonso Pimentel on 8/28/21.
//

import Foundation
import RealmSwift

class SaveUserInfo: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var username: String = ""
    @Persisted var password: String = ""
    @Persisted var uniqueId: Int = 0
    convenience init(username: String, password: String, uniqueId: Int) {
        self.init()
        self.username = username
        self.password = password
        self.uniqueId = uniqueId
    }
}

func saveUser(_ username: String, _ password: String) {
    
    if(!(username.isEmpty && password.isEmpty)) {
        //let a = username
        var config = Realm.Configuration.defaultConfiguration
        config.fileURL!.deleteLastPathComponent()
        config.fileURL!.appendPathComponent("a")
        config.fileURL!.appendPathExtension("realm")
        let localRealm = try! Realm(configuration: config)
        
        //create user and add them to the user realm file
        let randomInt = Int.random(in: 1..<1000)
        let userData = SaveUserInfo(username: username, password: password, uniqueId: randomInt)
        try! localRealm.write {
            localRealm.add(userData)
        }
        
        //create realm file for user created from their uniqueID
        var configUser = Realm.Configuration.defaultConfiguration
        configUser.fileURL!.deleteLastPathComponent()
        configUser.fileURL!.appendPathComponent(String(randomInt))
        configUser.fileURL!.appendPathExtension("realm")
        _ = try! Realm(configuration: configUser)

        print("User Created!")
        //return userData.uniqueId
    } else {
        print("Need username and password to create account")
        //return 0
    }
    
    //let a = username
    //var config = Realm.Configuration.defaultConfiguration
    //config.fileURL!.deleteLastPathComponent()
    //config.fileURL!.appendPathComponent(a)
    //config.fileURL!.appendPathExtension("realm")
    //let localRealm = try! Realm(configuration: config)
    //print(Realm.Configuration.defaultConfiguration.fileURL)
    /*
    if(!(username.isEmpty && password.isEmpty)) {
        let randomInt = Int.random(in: 1..<1000)
        let userData = SaveUserInfo(username: username, password: password, uniqueId: randomInt)
        try! localRealm.write {
            localRealm.add(userData)
        }
        print("User Created!")
        return userData.uniqueId
    } else {
        print("Need username and password to create account")
        return 0
    }
    */

}

func findUser(_ username: String, _ password: String) -> Int {

    var config = Realm.Configuration.defaultConfiguration
    config.fileURL!.deleteLastPathComponent()
    config.fileURL!.appendPathComponent("a")
    config.fileURL!.appendPathExtension("realm")
    let localRealm = try! Realm(configuration: config)
    
    
    //look into the a realm, find user and return its id
    let userData = localRealm.objects(SaveUserInfo.self)
    let specificUser = userData.filter("username == %@", username)
    
    if(specificUser[0].password == password) {
        print("Correct username and password...")
        return specificUser[0].uniqueId
    } else {
        print("Found user, but wrong password")
        return specificUser[0].uniqueId
    }
        
    
    
}
