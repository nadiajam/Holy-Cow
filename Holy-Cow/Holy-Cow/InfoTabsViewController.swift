//
//  InfoTabsViewController.swift
//  Holy-Cow
//
//  Created by Marky Pertsemlides on 7/18/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    @IBAction func dismissAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}


class InfoTabsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for subview in view.subviews {
            if let textField = subview as? UILabel {
                
                //bold
                
                
                
                
                
                
                
                
                //medium
                
                
                
                
                
                
                
                
                
                //helvetica
                
                
                
                
                if textField.tag == 1 { //tag 1 = titles = 40
                    textField.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 40.0)
                } else if textField.tag == 2 { //tag 2 = numbers = 60
                    textField.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 60.0)
                } else if textField.tag == 3 { //equal signs = 55
                    textField.font = UIFont(name: "GTWalsheimProTrial-Regular", size: 55.0)
                } else if textField.tag == 4 { //burger.etc. small labels = 25
                    textField.font = UIFont(name:"GTWalsheimProTrial-Regular", size: 25.0)
                }
                else { //standard text = 27
                    textField.font = UIFont(name: "GTWalsheimProTrial-Regular", size: 27.0)
                }
                
            }
        }
    }
    
    @IBAction func challengeButtonTapped(sender: UIButton) {
        switch sender.tag {
        case 0:
            //send first challenge info
            break
        case 1:
            //send 2nd challenge info
            break
        case 2:
            //send 3rd challenge info
            break
        default:
            //send 4th challenge info
            break
        }
        
        let storyboard = UIStoryboard(name: "Calendar", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        let application = UIApplication.sharedApplication()
        let window = application.keyWindow
        window?.rootViewController = viewController

    }
    
    
}