//
//  MainMenuView.swift
//  MainMenuView
//
//  Created by Alfonso Pimentel on 9/12/21.
//

import SwiftUI
import RealmSwift

struct MainMenuView: View {
    @EnvironmentObject var uniqueID: UniqueID
    
    var body: some View {
        VStack() {
            Spacer()
            TopHalf()
            //struct goes in here for top half
            //Spacer()
            BottomHalf()
            //struct goes in bottom half
            Spacer()
        }
        //.background(Color.black.edgesIgnoringSafeArea(.all))
    }
}


struct TopHalf: View {
    //@EnvironmentObject var uniqueID: UniqueID
    @ObservedObject var uniqueID: UniqueID = .shared
    
    var body: some View {
        ZStack() {
            Color.white
            VStack {
                Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                Spacer()
                Text(String(uniqueID.IDNumber))
            }
        }
    }
}

struct BottomHalf: View {
    var body: some View {
        ZStack() {
            Color.black//.edgesIgnoringSafeArea(.all)
            HStack {
                VStack(alignment: .leading, spacing: 50) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Team Comp")
                    }
                    .buttonStyle(MenuButton())
                    Button(action: {}) {
                        Text("Shop")
                    }
                    .buttonStyle(MenuButton())
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Settings")
                    }
                    .buttonStyle(MenuButton())
                }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Play!")
                }
                .buttonStyle(MenuButton())
                Spacer()
            }
        }
    }
    
    func teamComp() {
        
    }
    
}

struct MenuButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .font(.title)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
    }
}
struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
