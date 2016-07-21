//
//  InfoTabsViewController.swift
//  Holy-Cow
//
//  Created by Marky Pertsemlides on 7/18/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    @IBAction func dismissAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

}


class InfoTabsController: UIViewController {
    
    var destinationController = CalendarController()
    
    @IBAction func challengeButtonTapped(sender: UIButton) {
        var challengeArray:[Int] = []
        switch sender.tag {
        case 0:
            //send meatless mondays
            challengeArray = [1, 8, 15, 22, 29, 36]
            break
        case 1:
            //send checkerboard
            challengeArray = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
            break
        case 2:
            //send weekend carnivore
            challengeArray = [1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 26, 29, 30, 31, 32, 33, 36, 37, 38, 39, 40]
            break
        default:
            //send meatless month
            challengeArray += 0...41
            break
        }
        
        let storyboard = UIStoryboard(name: "Calendar", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier("UserCalendar") as! CalendarViewController
        viewController.calendarController.populate(challengeArray)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}