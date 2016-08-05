//
//  SettingsViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 8/4/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class ChallengesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var destinationController = CalendarController()
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
        default:
            //send meatless month
            challengeArray += 0...41
            break
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let tabController = segue.destinationViewController as? TabBarViewController {
            if tabController.viewControllers![1] is CalendarViewController {
                CalendarController.sharedInstance.populate(challengeArray)
            }
        }
    }


}
