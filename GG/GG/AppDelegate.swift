//
//  AppDelegate.swift
//  GG
//
//  Created by bakebrlk on 20.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window =  UIWindow(frame: UIScreen.main.bounds)
//        let viewC = UINavigationController(rootViewController: WelcomePage())
        window?.makeKeyAndVisible()
        
        window?.rootViewController = ViewController()
        
        return true
    }



}

