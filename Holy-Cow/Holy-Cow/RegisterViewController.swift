//
//  RegisterViewController.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/18/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class RegisterViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var connectLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    //amount that screen moves with keyboard
    let movement: CGFloat = 150.0
    
    @IBAction func signUpButtonTapped(sender: AnyObject) {
        
        let onCompletion = {(user: User?, message: String?) in
            print("inside register method")
            
            if user == nil {
                let errorAlert = UIAlertController(title: "Error", message: "not a user", preferredStyle: UIAlertControllerStyle.Alert)
                let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .Default)  { (action: UIAlertAction) in }
                errorAlert.addAction(dismissErrorAlert)
                self.presentViewController(errorAlert, animated: true, completion: nil)
            }
            else if self.emailField.text!.isValidEmail() == false {
                let errorAlert = UIAlertController(title: "Error", message: "Email is not valid", preferredStyle: UIAlertControllerStyle.Alert)
                let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .Default, handler: { (action) in })
                errorAlert.addAction(dismissErrorAlert)
                self.presentViewController(errorAlert, animated: true, completion: nil)
                
            }
            else if self.passwordField.text!.characters.count < 6 {
                let errorAlert = UIAlertController(title: "Error", message: "Password must be at least six characters long", preferredStyle: UIAlertControllerStyle.Alert)
                let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .Default, handler: { (action) in })
                errorAlert.addAction(dismissErrorAlert)
                self.presentViewController(errorAlert, animated: true, completion: nil)
            }
            else {
                let viewController = UIStoryboard(name: "InfoTabs", bundle: nil).instantiateInitialViewController()
                let window = UIApplication.sharedApplication().keyWindow
                window?.rootViewController = viewController
                
                //dismissing keyboard - returning veiw to normal bounds
                self.dismissKeyboard()
                self.textFieldDidEndEditing(self.passwordField)
                self.textFieldDidEndEditing(self.emailField)
            }
        }

        UserController.sharedInstance.register(emailField.text!, password: passwordField.text!, onCompletion: onCompletion)
     
    }
    
    @IBAction func closeButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting text field delegates
        passwordField.delegate = self
        emailField.delegate = self
        
        orLabel.layer.bounds = CGRectMake(0, 0, 70, 70)
        orLabel.layer.masksToBounds = true
        orLabel.layer.cornerRadius = 25
        orLabel.layer.borderColor = UIColor.whiteColor().CGColor
        orLabel.layer.borderWidth = 2
        
        closeButton.layer.bounds = CGRectMake(0, 0, 50, 50)
        closeButton.layer.masksToBounds = true
        closeButton.layer.cornerRadius = 15
        closeButton.layer.borderColor = UIColor.whiteColor().CGColor
        closeButton.layer.borderWidth = 2
        
        signUpButton.layer.cornerRadius = 3

        
        //fb button
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            print("user is already logged in")
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }

        //keyboard removal by touching on screen
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(recognizer)
    
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.bounds = CGRectOffset(self.view.bounds, 0, self.movement)
        })
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.bounds = CGRectOffset(self.view.bounds, 0, -self.movement)
        })
    }

    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    // Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
            print(error)
        }
        else if result.isCancelled {
            // Handle cancellations
            print("fb authentication canceled")
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
//            if result.grantedPermissions.contains("email") {
//                print("fb email accessed")
//            }
//            if result.grantedPermissions.contains("public_profile") {
//                print("fb public profile accessed")
//            }
//            if result.grantedPermissions.contains("user_friends") {
//                print("fb user friends accessed")
//            }
            
            if result.grantedPermissions.contains("email") && result.grantedPermissions.contains("public_profile") && result.grantedPermissions.contains("user_friends") {
                
                print("all fb user info accessed")
                
                self.returnUserData()
                
                UserController.sharedInstance.isLoggedIn = true
                
                let viewController = UIStoryboard(name: "InfoTabs", bundle: nil).instantiateInitialViewController()
                let window = UIApplication.sharedApplication().keyWindow
                window?.rootViewController = viewController
            }
            
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
        UserController.sharedInstance.isLoggedIn = false
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, gender, picture.type(large)"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                
                let userID = result.valueForKey("id")
                print("User ID is: \(userID)")
                UserController.sharedInstance.userID = userID as! String
                
                let userName = result.valueForKey("name")
                print("User Name is: \(userName)")
                UserController.sharedInstance.userName = userName as! String
                
                let userEmail = (result.valueForKey("email"))
                print("User Email is: \(userEmail)")
                UserController.sharedInstance.userEmail = userEmail as! String
                
                let userGender = result.valueForKey("gender")
                print("User Gender is: \(userGender)")
                UserController.sharedInstance.userGender = userGender as! String
                
                let userPicture = "http://graph.facebook.com/\(userID)/picture?type=large"
                UserController.sharedInstance.userProfilePic = userPicture
            }
        })
        
    }

    //self.returnUserData()    ^to call

    
}
