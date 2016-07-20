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

//    var calendarArray = [String](count: 42, repeatedValue: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelColors()
        
        var startCell: Int = 5 //change later with NSDate
        var endCell: Int = startCell + 30  //change later with NSDate
        
        
        var buttonsArray = [UIButton]() //ALL BUTTONS IN CALENDAR
        let calendarDays = [Int](startCell...endCell) //MONTH DAYS
        
        
        //ordered array of buttons based on button tag
        for subview in calendarBoard.subviews {
            if let backView = subview as UIView? {
                backView.backgroundColor = UIColor.whiteColor()
            }
            if let cell = subview as? UIButton {
                for i in 0...42 {
                    if cell.tag == i {
                        buttonsArray.append(cell)
                    }
                    continue
                }
            }
        }
        
        
        for day in calendarDays { //1 - 30
            
            for button in buttonsArray { //1 - 42
                
                
                
            }
            
        }
        
        
        
        
        
/* *** Nadia's code ******
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
                
                calendarCell.backgroundColor = UIColor.whiteColor()
//                if button.tag =
//                button.setTitle("\(button.tag)", forState: .Normal)
                button.setTitle("\(calendarArray[button.tag])", forState: .Normal)
                button.setTitleColor(UIColor.holyBlack, forState: .Normal)
                //button.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, forState: UIControlState)  OMG HERE WE ADD THE CIRCLE BACKGROUND
            }
            
        }
 */
        
        
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
