//
//  UserController.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/22/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class UserController: NSObject {
    
    static var sharedInstance = UserController()
    var currentUser: User?
    private var userList: [User] = []
    var userID:String = ""
    var userName:String = ""
    var userEmail:String = ""
    var userGender:String = ""
    var userProfilePic:String = ""
    var isLoggedIn:Bool = false
    
    func register(email:String, password:String, onCompletion:(User?,String?) -> ()) {

        currentUser = User(email: email, password: password)
        userList.append(currentUser!)
        onCompletion(currentUser, nil)

        // Persistence
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(email, forKey: "email")
        defaults.setObject(password, forKey: "password")
        defaults.synchronize()
        
    }
    
    func login(email: String, password: String, onCompletion:(User?,String?) -> Void) {

        currentUser = User(email: email, password: password)
        onCompletion(currentUser, nil)
        
        for user in userList {
            if user.email == email && user.password == password {
                print("cool")
            }
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(email, forKey: "email")
        defaults.setObject(password, forKey: "password")
        defaults.synchronize()
    }
    
    func logout(onCompletion onCompletion: (String?) -> Void) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("email")
        defaults.removeObjectForKey("password")
        defaults.synchronize()
        
        self.currentUser = nil
        onCompletion(nil)
    }

}