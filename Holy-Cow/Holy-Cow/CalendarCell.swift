//
//  CalendarCell.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/20/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

enum PastDate {
    case Achieved, Failed, Unset
}

enum FutureDate {
    case Meat, Meatless
}

class CalendarCell: UIButton {
    //initialize to empty calendar
    var calendar = [FutureDate](count: 42, repeatedValue: .Meat)
    
    
    func changePastDate() {
         
    }
    
    func changeFutureDate() {
        
    }
    
}
