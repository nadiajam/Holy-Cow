//
//  Calendar.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 8/5/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

enum DayOutcome: String  {
    case Success = "success"
    case Failure = "failure"
    case Unset = "unset"
}

enum DayGoal: String {
    case Meat = "meat"
    case Meatless = "meatless"
}


class CalendarDate: NSObject, NSCoding {
    
    var goal: DayGoal
    var outcome: DayOutcome

    
    init(goal: DayGoal, outcome: DayOutcome) {
        self.goal = goal
        self.outcome = outcome
    }
    
    required init(coder aDecoder: NSCoder) {
        self.goal = DayGoal(rawValue: (aDecoder.decodeObjectForKey("goal") as! String)) ?? .Meat
        self.outcome = DayOutcome(rawValue: (aDecoder.decodeObjectForKey("outcome") as! String)) ?? .Unset
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.goal.rawValue, forKey:"goal")
        aCoder.encodeObject(self.outcome.rawValue, forKey:"outcome")
    }


}

