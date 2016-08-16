//
//  PersonalViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 8/16/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController {

    @IBOutlet weak var profPic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var leafIcon: UIButton!
    @IBOutlet weak var humanIcon: UIButton!
    @IBOutlet weak var alarmIcon: UIButton!
    @IBOutlet weak var tab1: UIView!
    @IBOutlet weak var tab2: UIView!
    @IBOutlet weak var tab3: UIView!
    
    var lunchAlarmSet: Bool = false
    var todaysDate:NSDate = NSDate()
    var dateFormatter:NSDateFormatter = NSDateFormatter()
    var dateInFormat: String = ""
    
    @IBAction func leafSelected(sender: AnyObject) {
        tab1.backgroundColor = UIColor.lightGrayColor()
        tab2.backgroundColor = UIColor.clearColor()
        tab3.backgroundColor = UIColor.clearColor()
        
        //programatically add the veiw for leaf page
    }
    
    @IBAction func humanSelected(sender: AnyObject) {
        tab2.backgroundColor = UIColor.lightGrayColor()
        tab1.backgroundColor = UIColor.clearColor()
        tab3.backgroundColor = UIColor.clearColor()
        humanIcon.tintColor = UIColor.lightGrayColor()
        
        //programatically add the view for human page
    }

    @IBAction func alarmSelected(sender: AnyObject) {
        tab3.backgroundColor = UIColor.lightGrayColor()
        tab1.backgroundColor = UIColor.clearColor()
        tab2.backgroundColor = UIColor.clearColor()
        
        //programatically add the view for alarm page
//        let alarmButton = UIButton()
//        alarmButton.backgroundColor = UIColor.holyRed
//        alarmButton.layer.cornerRadius = 3
//        alarmButton.frame = CGRect(x: (generalView.frame.origin.x + 50), y: (generalView.frame.origin.x + 50), width: 100, height: 50)
//        alarmButton.setTitle("set lunch alarm", forState: .Normal)
//        alarmButton.addTarget(self, action: #selector(lunchAlarm), forControlEvents: .TouchUpInside)
//        self.view.addSubview(alarmButton)
    }
    
    
    func lunchAlarm() -> () {
        //if its noon
        if String(dateInFormat) == "15:27" {
            let errorAlert = UIAlertController(title: "Reminder", message: "today is your meatless day!", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissErrorAlert = UIAlertAction(title: "Got It", style: .Default)  { (action: UIAlertAction) in }
            errorAlert.addAction(dismissErrorAlert)
            self.presentViewController(errorAlert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profPic.layer.cornerRadius = 8
        profPic.layer.masksToBounds = false
        profPic.layer.borderColor = UIColor.blackColor().CGColor
        profPic.layer.borderWidth = 1
        profPic.layer.cornerRadius = profPic.frame.height/2
        profPic.clipsToBounds = true
        
        nameLabel.text = UserController.sharedInstance.currentUser?.fullName
        
        generalView.layer.cornerRadius = 3
        tab1.layer.cornerRadius = 3
        tab2.layer.cornerRadius = 3
        tab3.layer.cornerRadius = 3
        
        tab1.backgroundColor = UIColor.lightGrayColor()
        tab2.backgroundColor = UIColor.clearColor()
        tab3.backgroundColor = UIColor.clearColor()
        
        dateFormatter.dateFormat = "HH:mm"
        dateInFormat = dateFormatter.stringFromDate(todaysDate)
        print(dateInFormat)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
