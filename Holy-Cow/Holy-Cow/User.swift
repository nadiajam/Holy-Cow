//
//  User.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/22/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class User: NSObject {
        
    var email: String
    var password: String?
    var fbID: String?
    
    init(email:String, password:String?, fbID:String?) {
        self.email = email
        self.password = password
        self.fbID = fbID
    }

}
