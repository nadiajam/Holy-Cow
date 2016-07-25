//
//  LoginViewController.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/19/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var connectLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    //amount that screen moves with keyboard
    let movement: CGFloat = 150.0
    
    //makes the close button work
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //email and password verification
    @IBAction func signInButtonTapped(sender: UIButton) {
        if emailField.text!.isValidEmail() == false {
            let errorAlert = UIAlertController(title: "Error", message: "User email not found", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .Default, handler: { (action) in })
            errorAlert.addAction(dismissErrorAlert)
            self.presentViewController(errorAlert, animated: true, completion: nil)
        } else if passwordField.text!.characters.count < 6 {
            let errorAlert = UIAlertController(title: "Error", message: "The password does not match the user email", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .Default, handler: { (action) in })
            errorAlert.addAction(dismissErrorAlert)
            self.presentViewController(errorAlert, animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "Calendar", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()
            let application = UIApplication.sharedApplication()
            let window = application.keyWindow
            window?.rootViewController = viewController
            
            //dismissing keyboard - returning veiw to normal bounds
            dismissKeyboard()
            textFieldDidEndEditing(passwordField)
            textFieldDidEndEditing(emailField)
        }
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
        
        facebookButton.titleLabel?.textColor = UIColor.holyRed
        facebookButton.layer.cornerRadius = 3
        signInButton.layer.cornerRadius = 3
        
        view.layer.backgroundColor = UIColor.holyRed.CGColor //this does not work
        
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
    
}
