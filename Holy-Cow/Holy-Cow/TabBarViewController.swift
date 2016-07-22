//
//  TabBarViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/21/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        self.selectedIndex = 1

    }
}
