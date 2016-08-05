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
                button.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Regular", size: 18)
                
                //future day saved data
                if case .Meatless = CalendarController.sharedInstance.dataArray[button.tag].goal {
                    button.setBackgroundImage(UIImage(named: "GreenRing"), forState: .Normal)
                }
                
                
                //past day saved data
                if case .Success = CalendarController.sharedInstance.dataArray[button.tag].outcome {
//                    button.setBackgroundImage(UIImage(named: "GreenFilled"), forState: .Normal)
                    updateBlob(for: button.tag)
                }
                
                if case .Failure = CalendarController.sharedInstance.dataArray[button.tag].outcome {
//                    button.setBackgroundImage(UIImage(named: "RedFilled"), forState: .Normal)
                    updateBlob(for: button.tag)
                }
                
                
                //disabling button tap for inexistent calendar days
                if calendarArray[button.tag] == "" {
                    button.enabled = false
                    button.setBackgroundImage(nil, forState: .Normal)
                }
                
                if button.tag <= dayOfMonth + (dayOfWeek - 1) {
                    if CalendarController.sharedInstance.dataArray[button.tag].goal == DayGoal.Meat{
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
        
        // if days is in the past
        if sender.tag <= dayOfMonth + (dayOfWeek - 1) {
            
            // if it is set as meatless (goal)
            if CalendarController.sharedInstance.dataArray[sender.tag].goal  != .Meatless { return }
            // if unset, set to Success (...)
            if CalendarController.sharedInstance.dataArray[sender.tag].outcome != .Success {
                CalendarController.sharedInstance.dataArray[sender.tag].outcome = .Success
            } else {
                CalendarController.sharedInstance.dataArray[sender.tag].outcome = .Failure
            }
            
        }
        
        // if day is in the future
        else {
            if CalendarController.sharedInstance.dataArray[sender.tag].goal == .Meat {
                CalendarController.sharedInstance.dataArray[sender.tag].goal = .Meatless
            } else {
                CalendarController.sharedInstance.dataArray[sender.tag].goal = .Meat
            }
        }
        
        updateBlob(for: sender.tag)
        updateBlob(for: sender.tag - 1)
        updateBlob(for: sender.tag + 1)
    
        let manager = NSFileManager.defaultManager()
        let document = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = document.URLByAppendingPathComponent("calendarData.txt")
        NSKeyedArchiver.archiveRootObject(CalendarController.sharedInstance.dataArray, toFile: fileURL.path!)
    }
    
    func updateBlob(for senderTag: Int) {
        
        if senderTag < 0 || senderTag >= calendarArray.count { return }
        if calendarArray[senderTag].isEmpty { return }
        
        guard let sender = calendarBoard.viewWithTag(senderTag) as? UIButton else { return }
        
        let prev = senderTag > 0 ? CalendarController.sharedInstance.dataArray[senderTag - 1].outcome : .Unset
        let curr = CalendarController.sharedInstance.dataArray[senderTag].outcome
        let next = senderTag < calendarArray.count - 1 ? CalendarController.sharedInstance.dataArray[senderTag + 1].outcome : .Unset
        
        if curr == .Unset {
            let goal = CalendarController.sharedInstance.dataArray[senderTag].goal
            if goal == .Meatless {
                sender.setTitleColor(.blackColor(), forState: .Normal)
                sender.setBackgroundImage(UIImage(named: "GreenRing"), forState: .Normal)
            } else {
                sender.setTitleColor(.blackColor(), forState: .Normal)
                sender.setBackgroundImage(nil, forState: .Normal)
            }
        }
            
        else if curr == .Failure {
            sender.setTitleColor(.whiteColor(), forState: .Normal)
            sender.setBackgroundImage(UIImage(named: "RedFilled"), forState: .Normal)
        }
            
        else if prev != .Success && next != .Success {
            sender.setTitleColor(.whiteColor(), forState: .Normal)
            sender.setBackgroundImage(UIImage(named: "GreenFilled"), forState: .Normal)
        }
            
        else if prev != .Success && next == .Success {
            sender.setTitleColor(.whiteColor(), forState: .Normal)
            sender.setBackgroundImage(UIImage(named: "LeftBlob"), forState: .Normal)
        }
            
        else if prev == .Success && next != .Success {
            sender.setTitleColor(.whiteColor(), forState: .Normal)
            sender.setBackgroundImage(UIImage(named: "RightBlob"), forState: .Normal)
        }
            
        else {
            sender.setTitleColor(.whiteColor(), forState: .Normal)
            sender.setBackgroundImage(UIImage(named: "MiddleBlob"), forState: .Normal)
        }
    }

    
}
