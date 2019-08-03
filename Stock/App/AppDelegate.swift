//
//  AppDelegate.swift
//  Stock
//
//  Created by Артур on 29/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var app: Application?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    app = Application()
    FirebaseApp.configure()
    window?.rootViewController = app?.rootViewController()
    window?.makeKeyAndVisible()
    return true
  }
}

