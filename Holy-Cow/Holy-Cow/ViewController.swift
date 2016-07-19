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
        
        view.layer.backgroundColor = UIColor.holyRed.CGColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

