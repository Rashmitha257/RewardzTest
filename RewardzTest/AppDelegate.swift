//
//  AppDelegate.swift
//  RewardzTest
//
//  Created by Softsuave on 11/10/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: InitialViewController())
        return true
    }

}

