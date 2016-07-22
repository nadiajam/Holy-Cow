//
//  RecipesViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/20/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var shoppingListButton: UIButton!
    
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var filetsLabel: UILabel!
    @IBOutlet weak var redBellLabel: UILabel!
    @IBOutlet weak var peachesLabel: UILabel!
    @IBOutlet weak var oreganoLabel: UILabel!
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var combineLabel: UILabel!
    @IBOutlet weak var cloveLabel: UILabel!
    @IBOutlet weak var lemonLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.holyGreen
        
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.blackColor()
        
        // Fonts
        
        servingsLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 10.0)
        timeLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 10.0)
        ingredientsLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 10.0)
        filetsLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        redBellLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        peachesLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        oreganoLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        cloveLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        lemonLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        
        methodLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 10.0)
        combineLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        
        amountLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        minutesLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 10.0)
        
        // Round corners
        
//        favoriteButton.layer.cornerRadius = 3
//        shoppingListButton.layer.cornerRadius = 3
        
//        navigationController?.navigationBar.topItem.font
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
//        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: "GTWalsheimProTrial-Medium"]

    }
    

}
