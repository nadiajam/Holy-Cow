//
//  SettingsTableViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 8/8/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    
    let titleArray:[String] = ["account", "holy cow"]
    let sectionArray = [["about", "FAQ", "terms + conditions", "legal"], ["challenge", "edit profile", "change password", "log out"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "customCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray[section]
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return titleArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArray[section].count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath)
        cell.textLabel?.text = sectionArray[indexPath.section][indexPath.row]
        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if sectionArray[indexPath.section][indexPath.row] == "challenge" {
            transition()
        } else {
            let errorAlert = UIAlertController(title: "Error", message: "page not completed yet :(", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .Default)  { (action: UIAlertAction) in }
            errorAlert.addAction(dismissErrorAlert)
            self.presentViewController(errorAlert, animated: true, completion: nil)
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }

    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func transition() {
        let settingsStoryboard = UIStoryboard(name: "Settings", bundle: nil)
        let nextViewController = settingsStoryboard.instantiateViewControllerWithIdentifier("ChallengeViewController") as! ChallengeViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

}
