//
//  User.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/22/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var fullName: String
    var email: String
    var password: String?
    var fbID: String?
    
    init(fullName:String, email:String, password:String?, fbID:String?) {
        self.fullName = fullName
        self.email = email
        self.password = password
        self.fbID = fbID
    }

}
