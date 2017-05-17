//
//  AppDelegate.swift
//  LakhAdd
//
//  Created by 田涛 on 2017/5/17.
//  Copyright © 2017年 lakh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow()
        window?.backgroundColor = UIColor.white
   
        
   //登录界面
         window?.rootViewController = MoDaoLoginController()
        
      
   //主界面
   //     window?.rootViewController = MoDaoTabbarController()
        window?.makeKeyAndVisible()
        

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
          }

    func applicationDidEnterBackground(_ application: UIApplication) {
        }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        
    }


}

