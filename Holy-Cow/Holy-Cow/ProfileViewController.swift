//
//  profileViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/21/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var gallonNumberLabel: UILabel!
    
    @IBOutlet var progressArc: ProgressArc! //set later
    
    var meatNumber:Double = 0
    var currentStreakLength:Int = 0
    var currentLongestStreakLength:Int = 0
    var futureArcValue: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting fonts and colors
        numberLabel.textColor = UIColor.holyPurple
        numberLabel.font = UIFont(name:"GTWalsheimProTrial-Bold", size: 110.0)
        blueView.backgroundColor = UIColor.blueColor()
        
        print("this is the current streak length \(currentStreakLength)")
        
        for subview in view.subviews {
            if let textField = subview as? UILabel {
                
                if textField.tag == 4 { //tag 4 = general text
                    textField.font = UIFont(name:"GTWalsheimProTrial-Medium", size: 20.0)
                }
            }
        }
        
        //modifying profile numbers
        numberLabel.text = "\(Int(meatNumber))"
        gallonNumberLabel.text = "\(currentStreakLength)"
        progressArc.progressValue = futureArcValue
    }

}
