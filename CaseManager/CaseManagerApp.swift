//
//  CaseManagerApp.swift
//  CaseManager
//
//  Created by Hoàng Nam on 8/4/25.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct CaseManagerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
        
    }
    
}
