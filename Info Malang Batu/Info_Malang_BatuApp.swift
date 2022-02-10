//
//  Info_Malang_BatuApp.swift
//  Info Malang Batu
//
//  Created by Yusuf Saifudin on 06/02/22.
//

import SwiftUI
import Firebase
import GoogleMaps

@main
struct Info_Malang_BatuApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}

// https://betterprogramming.pub/how-to-use-firebase-in-swiftuis-new-application-lifecycle-c77a8a306d63
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if let path = Bundle.main.path(forResource: "keys", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                if let apiKey = dict["google_maps_api_key"] as? String {
                    print("AppDelegate # api key \(apiKey)")
                    GMSServices.provideAPIKey(apiKey)
                }
            }
        }
        return true
    }
}
