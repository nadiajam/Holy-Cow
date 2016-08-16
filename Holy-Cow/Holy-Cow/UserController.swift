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
    
    //don't think i need this...
//    var userID:String = ""
//    var userName:String = ""
//    var userEmail:String = ""
//    var userGender:String = ""
//    var userProfilePic:String = ""
    
    func facebookRegister(fullName: String, email:String?, fbID:String, onCompletion:(User?,String?) -> ()) {
        
        currentUser = User(fullName: fullName, email: email!, password: nil, fbID: fbID)
        userList.append(currentUser!)
        onCompletion(currentUser, nil)
        
        //Peristence
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(fullName, forKey: "fullName")
        defaults.setObject(email, forKey: "email")
        defaults.setObject(fbID, forKey: "fbID")
        defaults.synchronize()
    }
    
    func facebookLogin(fullName: String, email:String?, fbID:String, onCompletion:(User?,String?) -> ()) {
        
        currentUser = User(fullName: fullName, email: email!, password: nil, fbID: fbID)
        onCompletion(currentUser, nil)
        
        for user in userList {
            if user.email == email && user.fbID == fbID {
                print("good, they are an existing fb user!")
            }
        }
        
        //Peristence
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(fullName, forKey: "fullName")
        defaults.setObject(email, forKey: "email")
        defaults.setObject(fbID, forKey: "fbID")
        defaults.synchronize()
    }
    
    func emailRegister(fullName: String, email:String, password:String, onCompletion:(User?,String?) -> ()) {

        currentUser = User(fullName: fullName, email: email, password: password, fbID: nil)
        userList.append(currentUser!)
        onCompletion(currentUser, nil)

        // Persistence
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(fullName, forKey: "fullName")
        defaults.setObject(email, forKey: "email")
        defaults.setObject(password, forKey: "password")
        defaults.synchronize()
    }
    
    func emailLogin(fullName: String, email:String, password:String, onCompletion:(User?,String?) -> ()) {
        
        currentUser = User(fullName: fullName, email: email, password: password, fbID:nil)
        onCompletion(currentUser, nil)
        
        for user in userList {
            if user.fullName == fullName && user.email == email && user.password == password {
                print("good, they are an existing email user!")
            }
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(fullName, forKey: "fullName")
        defaults.setObject(email, forKey: "email")
        defaults.setObject(password, forKey: "password")
        defaults.synchronize()
    }

    
    //dont completely understand this...
    func logout(onCompletion onCompletion: (String?) -> ()) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("fullName")
        defaults.removeObjectForKey("email")
        defaults.removeObjectForKey("password")
        defaults.removeObjectForKey("fbID")
        defaults.synchronize()
        
        self.currentUser = nil
        onCompletion(nil)
    }

}