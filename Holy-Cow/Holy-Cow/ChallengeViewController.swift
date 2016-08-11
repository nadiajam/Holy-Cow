//
//  ChallengeViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 8/8/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    @IBOutlet weak var meatlessMondays: UIButton!
    @IBOutlet weak var checkerboard: UIButton!
    @IBOutlet weak var weekendCarnivore: UIButton!
    @IBOutlet weak var meatlessMonth: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meatlessMondays.layer.cornerRadius = 3
        checkerboard.layer.cornerRadius = 3
        weekendCarnivore.layer.cornerRadius = 3
        meatlessMonth.layer.cornerRadius = 3
    }
    
    //    var destinationController = CalendarController.sharedInstance
    var challengeArray:[Int] = []
    
    @IBAction func challengeButtonTapped(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            //send meatless mondays
            challengeArray = [1, 8, 15, 22, 29, 36]
            break
        case 2:
            //send checkerboard
            challengeArray = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
            break
        case 3:
            //send weekend carnivore
            challengeArray = [1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 26, 29, 30, 31, 32, 33, 36, 37, 38, 39, 40]
            break
        case 4:
            //send meatless month
            challengeArray += 0...41
            break
        default:
            //send empty calendar
            challengeArray = []
            break
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tabController = segue.destinationViewController as? TabBarViewController {
//            if tabController.viewControllers![1] is CalendarViewController {
                CalendarController.sharedInstance.populate(challengeArray)
//            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
