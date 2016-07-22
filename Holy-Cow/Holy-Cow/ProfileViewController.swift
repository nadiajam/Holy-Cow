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
//    @IBOutlet weak var gallonNumberLabel: UILabel!
    
    @IBOutlet var progressArc: ProgressArc! //set later
    
    @IBOutlet weak var scrollView: UIScrollView!
    
//    @IBOutlet weak var blueViewWidth: NSLayoutConstraint!
    
    
    var meatNumber:Double = 0
    var currentStreakLength:Int = 0
    var currentLongestStreakLength:Int = 0
    var futureArcValue: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.contentSize = CGSizeMake(scrollView.frame.width, 2000)
        numberLabel.textColor = UIColor.holyPurple
        
        for subview in view.subviews {
            if let textField = subview as? UILabel {
                
                if textField.tag == 4 { //tag 4 = general text
                    textField.font = UIFont(name:"GTWalsheimProTrial-Medium", size: 20.0)
                }
            }
        }
        
        //modifying profile numbers
        numberLabel.text = "\(Int(meatNumber))"
//        gallonNumberLabel.text = "\(currentStreakLength)"
        progressArc.progressValue = futureArcValue
    }

}
