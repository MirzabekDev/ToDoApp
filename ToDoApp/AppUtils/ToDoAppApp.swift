//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Mirzabek on 07/02/23.
//

import SwiftUI
import Firebase
@main
struct ToDoAppApp: App {
        
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            StarterPage().environmentObject(SessionStore())
                
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
