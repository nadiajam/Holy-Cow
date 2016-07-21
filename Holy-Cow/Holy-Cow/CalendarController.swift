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

class CalendarController: SendDataDelegate {
    //initializing goal and outcome arrays
    var outcomeArray = [DayOutcome](count: 42, repeatedValue: .Unset)
    var goalArray = [DayGoal](count: 42, repeatedValue: .Meat)
    
    var challengeArray = [Int]()
    
    func challengeChosen(challenge: [Int]) {
        challengeArray = challenge
        print(challengeArray)
    }
    
    
    //set plan here 
    func populate() {
        
        print("this is the actual thing populated!!!!!!!!\(challengeArray)")
        
        for item in challengeArray {
            goalArray[item] = .Meatless
        }
        
        print(challengeArray)
        print("justprintedagain_____________")
        
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