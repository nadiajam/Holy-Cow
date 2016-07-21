//
//  CalendarController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/20/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

enum DayOutcome {
    case Success, Failure, Unset
}

enum DayGoal {
    case Meat, Meatless
}

class CalendarController {
    //initializing goal and outcome arrays
    var outcomeArray = [DayOutcome](count: 42, repeatedValue: .Unset)
    var goalArray = [DayGoal](count: 42, repeatedValue: .Meat)
    
    var dummyChallenge = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
    
    
    //set plan here 
    func populate() {
        for item in dummyChallenge {
            goalArray[item] = .Meatless
        }
    }
    
    //tally how many days with goal of meatless in array
    func tallyGoal() -> Int {
        var goalNum = 0
        for item in goalArray {
            if item == .Meatless {
                goalNum += 1
            }
        }
        return goalNum
    }
    
    func tallyOutcome() -> Int {
        var outcomeNum = 0
        for item in outcomeArray {
            if item == .Success {
                outcomeNum += 1
            }
        }
        return outcomeNum
    }
    
}