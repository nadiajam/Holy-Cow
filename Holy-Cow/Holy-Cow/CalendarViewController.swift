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
    let dateFormatterOverall = NSDateFormatter()
    let dateComponents = NSDateComponents()
    
    var calendarArray = [String](count: 42, repeatedValue: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelColors()
        
        //setting title to current month
        dateFormatterOverall.dateFormat = "MMM yyyy"
        print(dateFormatterOverall.stringFromDate(today))
        monthLabel.text = dateFormatterOverall.stringFromDate(today)
        
        //getting number of days from month
        dateFormatterYear.dateFormat = "YYYY"
        dateFormatterMonth.dateFormat = "MM"
        var year = Int(dateFormatterYear.stringFromDate(today))
        var month = Int(dateFormatterMonth.stringFromDate(today))
        let dateComponents = NSDateComponents()
        dateComponents.year = year!
        dateComponents.month = month!
        
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateFromComponents(dateComponents)!
        
        let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date)
        let calendarDays:Int = range.length
        
        var July: [String] = []
        var firstNum = 1
        while firstNum <= calendarDays {
            July.append("\(firstNum)")
            firstNum += 1
        }
        
        calendarArray[5...calendarDays] = July[0..<July.count]
        
        for calendarCell in calendarBoard.subviews {
            for button in calendarCell.subviews as! [UIButton] {
                
                calendarCell.backgroundColor = UIColor.whiteColor()
                button.setTitle("\(calendarArray[button.tag])", forState: .Normal)
                button.setTitleColor(UIColor.holyBlack, forState: .Normal)
//                button.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, forState: UIControlState)  //OMG HERE WE ADD THE CIRCLE BACKGROUND
            }
        }
    }


    func setupLabelColors() {
        
        //setting background and bordercolors
        calendarLabel.backgroundColor = UIColor.holyGreen
        
        //setting text colors
        calendarLabel.textColor = UIColor.whiteColor()
        monthLabel.textColor = UIColor.holyGreen
        
        //setting day label colors
        for subview in daysView.subviews {
            if let dayLabel = subview as? UILabel {
                dayLabel.textColor = UIColor.holyGrey
            }
        }
    }

}
