//
//  CalendarController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/20/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
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
    var calendar: [String] = []
    var dayToday: Int = 0
    var startInterval: Int = 0
    
    //set plan here 
    func populate(challenge: [Int]) {
        for item in challenge {
            goalArray[item] = .Meatless
        }  
    }
    
    //tally how many days with goal of meatless in array
    func tallyGoal() -> Double {
        var goalNum: Double = 0.0
        for day in calendar {
            if (day != "") && (goalArray[calendar.indexOf(day)!] == .Meatless) {
                goalNum += 1.0
            }
            
        }
        return goalNum
    }
    
    func tallyOutcome() -> Double {
        var outcomeNum: Double = 0.0
        for item in outcomeArray {
            if item == .Success {
                outcomeNum += 1
            }
        }
        return outcomeNum
    }
    
    
    func currentStreakTally() -> Int {

        var streakNum = 0

        for i in (0...dayToday).reverse() where goalArray[i + startInterval - 1] == .Meatless {
            if outcomeArray[i + startInterval - 1] == .Success {
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
    
    
    // PUT THIS IN THE CALENDARVIEWCONTROLLER!!!!!!
    //for arc
    //for now, this is just for the current month
    func getArcFraction() -> Double {
        return Double(tallyOutcome() / tallyGoal())
    }
    
}