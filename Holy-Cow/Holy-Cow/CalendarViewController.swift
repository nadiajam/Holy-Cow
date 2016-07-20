//
//  CalendarViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/18/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var daysView: UIView!
    @IBOutlet weak var calendarLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarBoard: UIView!
    @IBOutlet weak var calendarViewLabel: UIView!
    
    let today = NSDate()
    let dateFormatterYear = NSDateFormatter()
    let dateFormatterMonth = NSDateFormatter()
    let dateFormatterDay = NSDateFormatter()
    let dateFormatterOverall = NSDateFormatter()
    let dateComponents = NSDateComponents()
    
    var calendarArray = [String](count: 42, repeatedValue: "")
    
    var dayOfMonth = 15 ///dummy current day of month
    
    var calendarController = CalendarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelColorsAndFonts()
        
        //setting title to current month
        dateFormatterOverall.dateFormat = "MMM yyyy"
        monthLabel.text = dateFormatterOverall.stringFromDate(today)
        
        //getting current day and month
        dateFormatterYear.dateFormat = "YYYY"
        dateFormatterMonth.dateFormat = "MM"
        dateFormatterDay.dateFormat = "dd"
        let year = Int(dateFormatterYear.stringFromDate(today))
        let month = Int(dateFormatterMonth.stringFromDate(today))
        let dateComponents = NSDateComponents()
        dateComponents.year = year!
        dateComponents.month = month!
        
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateFromComponents(dateComponents)!
        
        let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date)
        let calendarDays:Int = range.length
        
        let startOfMonth = calendar.dateFromComponents(dateComponents)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let startDateComponents = myCalendar.components(.Weekday, fromDate: startOfMonth)
        let weekDay = startDateComponents.weekday - 1
        
        
        //array containing items 1 through days in current month
        var monthArray: [String] = []
        var firstNum = 1
        while firstNum <= calendarDays {
            monthArray.append("\(firstNum)")
            firstNum += 1
        }
        
        calendarArray[weekDay...calendarDays] = monthArray[0..<monthArray.count]
        
        for calendarCell in calendarBoard.subviews {
            for button in calendarCell.subviews as! [UIButton] {
                calendarCell.backgroundColor = UIColor.whiteColor()
                button.setTitle("\(calendarArray[button.tag])", forState: .Normal)
                button.setTitleColor(UIColor.holyBlack, forState: .Normal)
//                button.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, forState: UIControlState)  //OMG HERE WE ADD THE CIRCLE BACKGROUND
                
                //disabling button tap for inexistent days
                if calendarArray[button.tag] == "" {
                    button.enabled = false
                }
            }
        }
        
        
        
    }


    func setupLabelColorsAndFonts() {
        
        //setting background and bordercolors
        calendarLabel.backgroundColor = UIColor.holyGreen
        
        //setting text colors
        calendarLabel.textColor = UIColor.whiteColor()
        monthLabel.textColor = UIColor.holyGreen
        
        //setting day label colors
        for subview in daysView.subviews {
            if let dayLabel = subview as? UITextField {
                dayLabel.textColor = UIColor.holyGrey
                dayLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 15)
            }
        }
        
        //setting fonts
        calendarLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 25.0)
        monthLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 18.0)
    }
    
    
    @IBAction func calendarCellTapped(sender: UIButton) {
        
        if calendarController.goalArray[sender.tag] == DayGoal.Meat {
            calendarController.goalArray[sender.tag] = .Meatless
//            print("just set button \(sender.tag) to MEATLESS")
            sender.setBackgroundImage(UIImage(named: "GreyRing"), forState: .Normal)
            
        } else {
            calendarController.goalArray[sender.tag] = .Meat
//            print("just set button \(sender.tag)to MEAT")
            sender.setBackgroundImage(nil, forState: .Normal)
        }

    }


}
