//
//  distanceappApp.swift
//  distanceapp
//
//  Created by Ming Xu on 12/22/25.
//

import SwiftUI
import FirebaseCore



@main
struct distanceappApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
