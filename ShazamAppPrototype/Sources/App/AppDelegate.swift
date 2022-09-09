//
//  AppDelegate.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 08.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = ShazamController()
        window?.makeKeyAndVisible()
        
        return true
    }


}

