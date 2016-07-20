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
                if textField.tag == 1 { //tag 1 = titles
                    textField.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 40.0)
                } else if textField.tag == 2 { //tag 2 = numbers
                    textField.font = UIFont(name: "GTWalsheimProTrial-Bold", size: 60.0)
                } else if textField.tag == 3 { //equal signs
                    textField.font = UIFont(name: "GTWalsheimProTrial-Regular", size: 60.0)
                } else { //standard text
                    textField.font = UIFont(name: "GTWalsheimProTrial-Regular", size: 27.0)
                }
                
            }
        }
    }
    
}