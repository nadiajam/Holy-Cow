//
//  CalendarController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/20/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit

class CalendarController {
    //making class into singleton
    static let sharedInstance = CalendarController()
    var dataArray = [CalendarDate]()
    var longestStreak = 0
    var calendar: [String] = []
    var dayToday: Int = 0
    var startInterval: Int = 0
    
    //adding persistence 
    

    private init() {
        let manager = NSFileManager.defaultManager()
        let document = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = document.URLByAppendingPathComponent("calendarData.txt")
            
        if let dataEntry = NSKeyedUnarchiver.unarchiveObjectWithFile(fileURL.path!) as? [CalendarDate] {
            self.dataArray = dataEntry
            print("\(dataArray)")
        } else{
            for _ in 0...41{
                dataArray.append(CalendarDate(goal: .Meat, outcome: .Unset))
            }
        }
    }
    
    //set plan here 
    func populate(challenge: [Int]) {
        //reclearing the dataArray to avoid repeats
//        for item in 0...41{
//            self.dataArray[item].goal = .Meat
//            self.dataArray[item].outcome = .Unset
//        }
        
        for number in (0...dataArray.count-1) {
            for day in challenge {
                if number == day {
                    dataArray[number].goal = .Meatless
                }
            }
        }

        let manager = NSFileManager.defaultManager()
        let document = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = document.URLByAppendingPathComponent("calendarData.txt")
        NSKeyedArchiver.archiveRootObject(self.dataArray, toFile: fileURL.path!)
    }
    
    //tally how many days with goal of meatless in array
    func tallyGoal() -> Double {
        var goalNum: Double = 0.0
        for day in calendar {
            if (day != "") && (dataArray[calendar.indexOf(day)!].goal == .Meatless) {
                goalNum += 1.0
            }
        }
        return goalNum
    }
    
    func tallyOutcome() -> Double {
        var outcomeNum: Double = 0.0
        for item in dataArray {
            if item.outcome == .Success {
                outcomeNum += 1
            }
        }
        return outcomeNum
    }
    
    
    func currentStreakTally() -> Int {
        var streakNum = 0
        for i in (0...dayToday).reverse() where dataArray[i + startInterval - 1].goal == .Meatless {
            if dataArray[i + startInterval - 1].outcome == .Success {
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
    
    
//    // PUT THIS IN THE CALENDARVIEWCONTROLLER!!!!!! lol if we have time
    func getArcFraction() -> Double {
        return Double(tallyOutcome() / tallyGoal())
    }
}
