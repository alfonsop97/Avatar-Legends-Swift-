//
//  ContentView.swift
//  Avatar Legends
//
//  Created by Alfonso Pimentel on 8/26/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    //@EnvironmentObject var uniqueID: UniqueIDForUsers
    //@StateObject var uniqueID = UniqueID()
    @ObservedObject var uniqueID: UniqueID = .shared
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var title: String = "Avatar Legends"
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding()
                    .font(.title)
                    .foregroundColor(Color.white)
            }
            Spacer()
            TextField(
                "Username...",
                 text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            TextField(
                "Password...",
                 text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            HStack {
                Button(action: {
                    signIn(username, password)
                }) {
                    Text("Log in")
                        .font(.title2)
                        .padding()
                        .background(Color.white)
                }
                Button(action: {
                    createAccount(username, password)

                }) {
                    Text("Create Account")
                        .font(.title2)
                        .padding()
                        .background(Color.white)
                }
                
            }
            Spacer()
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }



    func signIn(_ username: String, _ password: String) {
        //let accountUser = findUser(username, password)
        
        //Need to develop switch statement for edge cases
        
        //if(username == "Alfonso" && password == "hi") {
            //title = "right"
            //main menu view
           // viewRouter.currentPage = .page2
        //} else {
        
        //Get usernames uniqueID
        let accountUser = findUser(username, password)
        print(accountUser)
        
        //var config = Realm.Configuration.defaultConfiguration
        //config.fileURL!.deleteLastPathComponent()
        //config.fileURL!.appendPathComponent(String(accountUser))
        //config.fileURL!.appendPathExtension("realm")
        //let localRealm = try! Realm(configuration: config)
        uniqueID.IDNumber = accountUser
        //MainMenuView().environmentObject(uniqueID)
        viewRouter.currentPage = .page2
            
    }
    
    func createAccount(_ username: String, _ password: String) {
        
        //check parameters of password & if username is available
        //then pass onto wrtiing into realm
        title = "Account Created"
        saveUser(username, password)
        viewRouter.currentPage = .page3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class UniqueID: ObservableObject {
    private init() {}
    static let shared = UniqueID()
    @Published var IDNumber = 0
}
