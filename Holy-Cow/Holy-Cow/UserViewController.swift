//
//  UserController.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/22/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class UserController: NSObject {
    
    static var sharedInstace = UserController()
    
    var currentUser: User?
    private var userList: [User] = []
    
    func register(email:String, password:String, onCompletion:(User?,String?) -> Void) {
        
        currentUser = User(email: email, password: password)
        userList.append(currentUser!)
        
        for user in userList {
            if user.email == email {
                print("you are already a user")
            }
        }

        // Persistence
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(email, forKey: "email")
        defaults.setObject(password, forKey: "password")
//        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func login(email: String, password: String) {
        
        for user in userList {
            if user.email == email && user.password == password {
                currentUser = user
            }
        }
    }
}