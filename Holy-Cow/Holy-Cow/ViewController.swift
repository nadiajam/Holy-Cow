//
//  ViewController.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/17/16.
//  Copyright © 2016 Holy-Cow iOS Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.layer.backgroundColor = UIColor.holyRed.CGColor
        self.navigationController?.navigationBarHidden = true
        
        // Setting customized fonts
        
        signInButton.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 20.0)
        signUpButton.titleLabel!.font = UIFont(name: "GTWalsheimProTrial-Medium", size: 20.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

