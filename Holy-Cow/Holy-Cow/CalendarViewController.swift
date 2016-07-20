//
//  CalendarViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/18/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var sundayLabel: UITextField!
    @IBOutlet weak var mondayLabel: UITextField!
    @IBOutlet weak var tuesdayLabel: UITextField!
    @IBOutlet weak var wednesdayLabel: UITextField!
    @IBOutlet weak var thursdayLabel: UITextField!
    @IBOutlet weak var fridayLabel: UITextField!
    @IBOutlet weak var saturdayLabel: UITextField!
    @IBOutlet weak var calendarBoard: UIView!
    @IBOutlet weak var calendarViewLabel: UIView!
    
    var calendarArray = [String](count: 42, repeatedValue: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendarDays: Int = 31
        let startDate: Int = 4
        let endDate: Int = startDate + 30
        
        var firstNum = 1
        
        for var item in calendarArray[startDate...endDate] {
            item = "\(firstNum)"
            firstNum += 1
            //            print(item)
        }
        
        //calendarArray = ["", "", "", "", "", 1, 3, 4... 34, 35, "", "", "", "", "", "", ""]
        
        for calendarCell in calendarBoard.subviews {
            for button in calendarCell.subviews as! [UIButton] {
//                if button.tag =
//                button.setTitle("\(button.tag)", forState: .Normal)
                button.setTitle("\(calendarArray[button.tag])", forState: .Normal)
                button.setTitleColor(UIColor.holyBlack, forState: .Normal)
                //button.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, forState: UIControlState)  OMG HERE WE ADD THE CIRCLE BACKGROUND
            }
        }
        
        for calendarCell in calendarBoard.subviews {
            calendarCell.backgroundColor = UIColor.whiteColor()
        }
       
        
        //setting background and bordercolors
        calendarLabel.backgroundColor = UIColor.holyGreen
        
        //setting text colors
        calendarLabel.textColor = UIColor.whiteColor()
        monthLabel.textColor = UIColor.holyGreen
        sundayLabel.textColor = UIColor.holyGrey
        mondayLabel.textColor = UIColor.holyGrey
        tuesdayLabel.textColor = UIColor.holyGrey
        wednesdayLabel.textColor = UIColor.holyGrey
        thursdayLabel.textColor = UIColor.holyGrey
        fridayLabel.textColor = UIColor.holyGrey
        saturdayLabel.textColor = UIColor.holyGrey
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
