//
//  Week11App.swift
//  Week11
//
//  Created by BilalSamoon on 2023-07-27.
//

import SwiftUI

@main
struct Week11App: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            
            TicTacToeView()
        }.onChange(of: scenePhase){currentPhase in
            
            
        switch (currentPhase){
            
        case .active:
            print("App in Active State")
        case .inactive:
            print("App in INActive State")
        case .background:
            print("App in Background State")
        @unknown default:
            print("App is not running")
            
            
            }
            
        }
    }
}
