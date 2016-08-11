//
//  TabBarViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/21/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting index 1 as the loaded view controller
        self.selectedIndex = 1
        
        //changing background image of tab when selected
        let tabBar = self.tabBar
//        var selectedProfileImage = UIImage(named: "")
//        (tabBar.items![0]).selectedImage = UIImage(named: "userWhite")?.imageWithRenderingMode(.AlwaysOriginal)
//        (tabBar.items![1]).selectedImage = UIImage(named: "UserWhite")?.imageWithRenderingMode(.AlwaysOriginal)
//        (tabBar.items![2]).selectedImage = UIImage(named: "forkWhite")?.imageWithRenderingMode(.AlwaysOriginal)
//        (tabBar.items![3]).selectedImage = UIImage(named: "UserWhite")?.imageWithRenderingMode(.AlwaysOriginal)
//        (tabBar.items![4]).selectedImage = UIImage(named: "usersWhite")?.imageWithRenderingMode(.AlwaysOriginal)
        
        tabBar.tintColor = UIColor.holyBlue

    }
    
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        // - 40 is editable , I think the default value is around 50 px, below lowers the tabbar and above increases the tab bar size
        tabFrame.size.height = 90
        tabFrame.origin.y = self.view.frame.size.height - 80
        self.tabBar.frame = tabFrame
    }
    
    
}
