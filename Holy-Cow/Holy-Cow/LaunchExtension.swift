//
//  LaunchExtension.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 8/15/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

extension UIApplication {
    class func isFirstLaunch() -> Bool {
        if !NSUserDefaults.standardUserDefaults().boolForKey("HasAtLeastLaunchedOnce") {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "HasAtLeastLaunchedOnce")
            NSUserDefaults.standardUserDefaults().synchronize()
            return true
        }
        return false
    }
}
