//
//  CalendarController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/20/16.
//  Copyright © 2016 Holy-Cow iOS Team. All rights reserved.
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
    var longestStreak = 0
    
    //set plan here 
    func populate(challenge: [Int]) {
        for item in challenge {
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
    
    
    func currentStreakTally() -> Int {
        
        var streakNum = 0
        
        for i in (0...16).reverse() where goalArray[i] == .Meatless {
            if outcomeArray[i] == .Success {
                streakNum += 1
            } else {
                break
            }
        }
        
        if streakNum > longestStreak {
            longestStreak = streakNum
        }
        return streakNum
    }
    
    
    func longestStreakTally() -> Int {
        return longestStreak
    }

    
}