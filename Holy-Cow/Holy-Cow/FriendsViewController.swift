//
//  FriendsViewController.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/26/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var inviteFriendsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inviteFriendsButton.layer.cornerRadius = 3
    }
}
