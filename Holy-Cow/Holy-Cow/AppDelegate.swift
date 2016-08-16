//
//  AppDelegate.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/17/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit
import FBSDKCoreKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        //user login through email
        
        if let fullName = defaults.stringForKey("fullName"), email = defaults.stringForKey("email"), password = defaults.stringForKey("password") {
            UserController.sharedInstance.emailLogin(fullName, email: email, password: password, onCompletion: { (user, error) in
                if user != nil {
                    let viewController = UIStoryboard(name: "Calendar", bundle: nil).instantiateInitialViewController()
                    self.window?.rootViewController = viewController
                }
                else {
                    let viewController = UIStoryboard (name: "Main", bundle: nil).instantiateInitialViewController()
                    self.window?.rootViewController = viewController
                }
            })
        }
        
        
        // user login through facebook 
        
        if let fullName = defaults.stringForKey("fullName"), email = defaults.stringForKey("email"), fbID = defaults.stringForKey("fbID") {
            UserController.sharedInstance.facebookLogin(fullName, email: email, fbID: fbID, onCompletion: { (user, error) in
                if user != nil {
                    let viewController = UIStoryboard(name: "Calendar", bundle: nil).instantiateInitialViewController()
                    self.window?.rootViewController = viewController
                }
                else {
                    let viewController = UIStoryboard (name: "Main", bundle: nil).instantiateInitialViewController()
                    self.window?.rootViewController = viewController
                }
            })
        }
        
        //nav bar
        UINavigationBar.appearance().barTintColor = UIColor.holyGreen
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        //fb integration
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        FBSDKAppEvents.activateApp()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

