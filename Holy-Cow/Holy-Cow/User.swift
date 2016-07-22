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
    var password: String
    
    init(email:String,password:String) {
        self.email = email
        self.password = password
    }

}
