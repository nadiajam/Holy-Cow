//
//  LoginViewController.swift
//  Holy-Cow
//
//  Created by Enrique Pajuelo on 7/19/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
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
        
        view.layer.backgroundColor = UIColor.holyRed.CGColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
