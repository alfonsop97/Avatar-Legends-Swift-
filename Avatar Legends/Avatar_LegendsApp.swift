//
//  Avatar_LegendsApp.swift
//  Avatar Legends
//
//  Created by Alfonso Pimentel on 8/26/21.
//

import SwiftUI

@main
struct Avatar_LengendsApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
        }
    }
}
