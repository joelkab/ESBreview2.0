//
//  ESBreview2_0App.swift
//  ESBreview2.0
//
//  Created by Joel Kabura on 6/1/22.
//

import SwiftUI
import Firebase



@main
struct ESBreview2_0App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       
        
    FirebaseApp.configure()
        
        
    return true
  }
}

