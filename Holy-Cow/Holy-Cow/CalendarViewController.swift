//
//  CalendarViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/18/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var daysView: UIView!
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
    var dayOfMonth:Int = 0
    var dayOfWeek:Int = 0
    
    
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
        dayOfMonth = Int(dateFormatterDay.stringFromDate(today))!
        let dateComponents = NSDateComponents()
        dateComponents.year = year!
        dateComponents.month = month!
        
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateFromComponents(dateComponents)!
        
        let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date)
        let calendarDays: Int = range.length //length of current month
        
        let startOfMonth = calendar.dateFromComponents(dateComponents)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let startDateComponents = myCalendar.components(.Weekday, fromDate: startOfMonth)
        dayOfWeek = startDateComponents.weekday - 1
        
        //array containing items 1 through days in current month
        var monthArray: [String] = []
        var firstNum = 1
        while firstNum <= calendarDays {
            monthArray.append("\(firstNum)")
            firstNum += 1
        }
        
        calendarArray[dayOfWeek...calendarDays] = monthArray[0..<monthArray.count]
        
        for calendarCell in calendarBoard.subviews {
            for button in calendarCell.subviews as! [UIButton] {
                calendarCell.backgroundColor = UIColor.whiteColor()
                button.setTitle("\(calendarArray[button.tag])", forState: .Normal)
                button.setTitleColor(UIColor.holyBlack, forState: .Normal)
                button.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Regular", size: 15)
                
                //improve runtime??? INCREMENTING INDEX
                if case .Meatless = CalendarController.sharedInstance.goalArray[button.tag] {
                    button.setBackgroundImage(UIImage(named: "GreenRing"), forState: .Normal)
                }
                
                //disabling button tap for inexistent calendar days
                if calendarArray[button.tag] == "" {
                    button.enabled = false
                    button.setBackgroundImage(nil, forState: .Normal)
                }
                
                if button.tag <= dayOfMonth + (dayOfWeek - 1) {
                    if CalendarController.sharedInstance.goalArray[button.tag] == DayGoal.Meat{
                        button.enabled = false
                    }
                }

                //setting current day label to blue color
                if dayOfMonth ==  (button.tag - dayOfWeek + 1) {
                    button.setTitleColor(UIColor.holyBlue, forState: .Normal)
                    button.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Regular", size: 18)
                }
            }
        }
        
        //sending updated data (calendarArray) and unaltered data (dayOfMonth & dayOfWeek) to calendar controller
        CalendarController.sharedInstance.calendar = calendarArray
        CalendarController.sharedInstance.dayToday = dayOfMonth
        CalendarController.sharedInstance.startInterval = dayOfWeek
    }


    func setupLabelColorsAndFonts() {
        
        //setting text and font colors
        monthLabel.textColor = UIColor.holyGreen
        monthLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 18.0)
        
        //setting day label colors
        for subview in daysView.subviews {
            if let dayLabel = subview as? UITextField {
                dayLabel.textColor = UIColor.holyGrey
                dayLabel.font = UIFont(name: "GTWalsheimProTrial-Regular", size: 25)
            }
        }
    }
    
    
    @IBAction func calendarCellTapped(sender: UIButton) {
        
        if sender.tag <= dayOfMonth + (dayOfWeek - 1) {
            
            if CalendarController.sharedInstance.goalArray[sender.tag] == DayGoal.Meatless {
           
                if CalendarController.sharedInstance.outcomeArray[sender.tag] == DayOutcome.Unset {
                    CalendarController.sharedInstance.outcomeArray[sender.tag] = .Success
                    sender.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                    if CalendarController.sharedInstance.outcomeArray[(sender.tag)-1] == .Success && CalendarController.sharedInstance.outcomeArray[(sender.tag)+1] == .Success {
                        sender.setBackgroundImage(UIImage(named: "MiddleBlob"), forState: .Normal)
                    }
                    else if CalendarController.sharedInstance.outcomeArray[(sender.tag)-1] == .Success && CalendarController.sharedInstance.outcomeArray[(sender.tag)+1] != .Success {
                        sender.setBackgroundImage(UIImage(named: "RightBlob"), forState: .Normal)
                    }
                    else if CalendarController.sharedInstance.outcomeArray[(sender.tag)+1] == .Success && CalendarController.sharedInstance.outcomeArray[(sender.tag)-1] != .Success {
                        sender.setBackgroundImage(UIImage(named: "LeftBlob"), forState: .Normal)
                    }
                    else {
                        sender.setBackgroundImage(UIImage(named: "GreenFilled"), forState: .Normal)
                    }
                }
                else if CalendarController.sharedInstance.outcomeArray[sender.tag] == DayOutcome.Success {
                    CalendarController.sharedInstance.outcomeArray[sender.tag] = .Failure
                    sender.setBackgroundImage(UIImage(named: "RedFilled"), forState: .Normal)
                    sender.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                }
                else {
                    CalendarController.sharedInstance.outcomeArray[sender.tag] = .Unset
                    sender.setBackgroundImage(UIImage(named: "GreenRing"), forState: .Normal)
                    if sender.tag == (dayOfMonth + (dayOfWeek) - 1) {
                        sender.setTitleColor(UIColor.holyBlue, forState: .Normal)
                    }
                    else {
                        sender.setTitleColor(UIColor.holyBlack, forState: .Normal)
                    }
                }
            }
        }

        if sender.tag > dayOfMonth + (dayOfWeek - 1) {
            if CalendarController.sharedInstance.goalArray[sender.tag] == DayGoal.Meat {
                CalendarController.sharedInstance.goalArray[sender.tag] = .Meatless
                sender.setBackgroundImage(UIImage(named: "GreenRing"), forState: .Normal)
            } else {
                CalendarController.sharedInstance.goalArray[sender.tag] = .Meat
                sender.setBackgroundImage(nil, forState: .Normal)
            }
        }

    }
    
}
