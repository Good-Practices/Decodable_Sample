//
//  AppDelegate.swift
//  TodoListCodableSample
//
//  Created by Onur Cantay on 17/09/2019.
//  Copyright © 2019 Onur Cantay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        prepareFirstViewController()
        return true
    }
}

private extension AppDelegate {
    func prepareFirstViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = TodoViewController()
    }
}

