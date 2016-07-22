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
    @IBOutlet weak var gallonNumberLabel: UILabel!
    @IBOutlet weak var forestAreaLabel: UILabel!
    @IBOutlet weak var grainsLabel: UILabel!
    @IBOutlet weak var carbonLabel: UILabel!
    @IBOutlet var progressArc: ProgressArc!
    
    @IBOutlet weak var scrollView: UIScrollView!

    
    var meatNumber:Double = 0
    var currentStreakLength:Int = 0
    var currentLongestStreakLength:Int = 0
    var futureArcValue: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSizeMake(scrollView.frame.width, 2000)
        setUpLabels()
    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        meatNumber = CalendarController.sharedInstance.tallyOutcome()
        currentStreakLength = CalendarController.sharedInstance.currentStreakTally()
        currentLongestStreakLength = CalendarController.sharedInstance.longestStreakTally()
        futureArcValue = CalendarController.sharedInstance.getArcFraction()
        progressArc.progressValue = futureArcValue
        setUpLabels()
    }
    
    func setUpLabels() {
        
        numberLabel.text = "\(Int(meatNumber))"
        
        
        //measurements = 4 oz of meat, for an average of chicken, beef, pork, turkey, and lamb
        
        let waterAverage = (128.0 + 460.0 + 180.0 + 120.0 + 312.0) / 5.0
        
        let forestAverage = (12.5 + 62.5 + 17.5 + 12.5 + 56.0)/5.0
        
        let grainAverage = (1.048 + 1.640 + 1.048 + 0.6 + 0.776)/5.0
        
        let carbonAverage = (0.844 + 3.752 + 1.688 + 0.796 + 4.000)/5.0
        
        //setting labels to actual stat values
        gallonNumberLabel.text = String(Int(waterAverage * meatNumber))
        forestAreaLabel.text = String(Int(forestAverage * meatNumber))
        grainsLabel.text = String(Int(grainAverage * meatNumber))
        carbonLabel.text = String(Int(carbonAverage * meatNumber))
    }

}
