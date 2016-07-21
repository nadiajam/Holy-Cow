//
//  profileViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/21/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var gallonNumberLabel: UILabel!
    
    var meatNumber:Int = 0
    var currentStreakLength:Int = 0
    var currentLongestStreakLength:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting fonts and colors
        numberLabel.textColor = UIColor.holyPurple
        numberLabel.font = UIFont(name:"GTWalsheimProTrial-Bold", size: 110.0)
        blueView.backgroundColor = UIColor.blueColor()
        
        for subview in view.subviews {
            if let textField = subview as? UILabel {
                
                if textField.tag == 4 { //tag 4 = general text
                    textField.font = UIFont(name:"GTWalsheimProTrial-Medium", size: 20.0)
                }
            }
        }
        
        //modifying profile numbers
        numberLabel.text = "\(meatNumber)"
        gallonNumberLabel.text = "\(currentStreakLength)"
        
        print(currentStreakLength)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
