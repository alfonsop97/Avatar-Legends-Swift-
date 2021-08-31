//
//  ContentView.swift
//  Avatar Legends
//
//  Created by Alfonso Pimentel on 8/26/21.
//

import SwiftUI

//Basically the main function of this view
struct ContentView: View {
    
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
                    let userInfo = createAccount(username, password)
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
        if(username == "Alfonso" && password == "hi") {
            title = "right"
        } else {
            title = "wrong"
            
        }
    }
    
    func createAccount(_ username: String, _ password: String) -> (String, String) {
        
        //check parameters of password & if username is available
        //then pass onto wrtiing into realm
        title = "Account Created"
        return (username, password)
    }
    
    func saveData(_ username: String, _ password: String) {
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
