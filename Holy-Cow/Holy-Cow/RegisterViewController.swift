//
//  RegisterViewController.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/18/16.
//  Copyright © 2016 Holy-Cow iOS Team. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var connectLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    @IBAction func signUpButtonTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "InfoTabs", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        let application = UIApplication.sharedApplication()
        let window = application.keyWindow
        window?.rootViewController = viewController
    }
    
    @IBAction func closeButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func emailFieldReturned(sender: UITextField) {
        passwordField.becomeFirstResponder()
    }
    
    @IBAction func passwordFieldReturned(sender: UITextField) {
        passwordField.resignFirstResponder()
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
        
        view.layer.backgroundColor = UIColor.holyRed.CGColor // this does not work
        
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
        signUpButton.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 20.0)
        connectLabel.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 32.0)
        
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }

}
