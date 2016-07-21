//
//  LoginViewController.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/19/16.
//  Copyright © 2016 Holy iOS Cows. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var connectLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBAction func emailFieldReturned(sender: UITextField) {
        passwordField.becomeFirstResponder()
    }
    
    @IBAction func passwordFieldReturned(sender: UITextField) {
        passwordField.resignFirstResponder()
    }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        view.layer.backgroundColor = UIColor.holyRed.CGColor //this does not work
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(recognizer)
        
        // Setting customized fonts
        
        orLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 20.0)
        facebookButton.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 20.0)
        closeButton.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 12.0)
        emailField.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 20.0)
        passwordField.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 20.0)
        emailLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 14.0)
        passwordLabel.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 14.0)
        signInButton.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 20.0)
        connectLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 32.0)
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        

    }

    @IBAction func signInButtonTapped(sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Calendar", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        let application = UIApplication.sharedApplication()
        let window = application.keyWindow
        window?.rootViewController = viewController
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        // 1
        var userInfo = notification.userInfo!
        // 2
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        // 3
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        // 4
        let changeInHeight = (CGRectGetHeight(keyboardFrame) + 40) * (show ? 1 : -1)
        //5
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.bottomConstraint.constant += changeInHeight
        })
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
}
