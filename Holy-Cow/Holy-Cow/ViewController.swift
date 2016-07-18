//
//  ViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/17/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        signInButton.backgroundColor = UIColor.holyRed
        signInButton.layer.cornerRadius = 4
        signUpButton.titleLabel?.textColor = UIColor.holyRed
        signUpButton.layer.borderColor = UIColor.holyRed.CGColor
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.cornerRadius = 4
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

