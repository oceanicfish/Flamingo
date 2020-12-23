//
//  FlamingoApp.swift
//  Flamingo
//
//  Created by Hey Fisher on 2020/12/07.
//

import SwiftUI
import Firebase

@main
struct FlamingoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                        launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Setting up Firebase...")
        FirebaseApp.configure()
        return true
    }
}
