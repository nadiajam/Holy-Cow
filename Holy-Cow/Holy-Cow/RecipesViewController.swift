//
//  RecipesViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/20/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.holyGreen
        
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.blackColor()
        
        // Do any additional setup after loading the view.
    }
    

}
