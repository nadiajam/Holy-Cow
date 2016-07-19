//
//  InfoTabsViewController.swift
//  Holy-Cow
//
//  Created by Marky Pertsemlides on 7/18/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit
import Foundation

class InfoTabsViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    //colors of info tabs in order of tabs appearance
    let colorsArray = [UIColor.holyPurple, UIColor.holyBlue, UIColor.holyOrange, UIColor.holyGreen, UIColor.whiteColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        //loads the first view controller
        if let firstInfoTab = infoTabsArray.first {
            setViewControllers([firstInfoTab], direction: .Forward, animated: true, completion: nil)
        }
        
        self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 30)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for i in 0..<infoTabsArray.count {
            infoTabsArray[i].view.backgroundColor = colorsArray[i]
            infoTabsArray[i].view.frame = UIScreen.mainScreen().bounds
        }
    }
    
    //Instantiates ordered array variable of infoTabs
    private(set) var infoTabsArray:[UIViewController] = {
        //local function - takes in a string name that identifies which tab it is
        func newInfoTab(tabNum: String) -> UIViewController {
            return UIStoryboard(name: "InfoTabs", bundle: nil).instantiateViewControllerWithIdentifier("\(tabNum)Tab")
        }
        //returns array of ordered infoTabs
        return [newInfoTab("First"), newInfoTab("Second"), newInfoTab("Third"), newInfoTab("Fourth"), newInfoTab("Fifth")]
    }()
}


extension InfoTabsViewController : UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        guard let infoTabIndex = infoTabsArray.indexOf(viewController) else {
            return nil
        }
        let previousIndex = infoTabIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        
        return infoTabsArray[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        guard let infoTabIndex = infoTabsArray.indexOf(viewController) else {
            return nil
        }
        let nextIndex = infoTabIndex + 1
        let tabsCount = infoTabsArray.count
        guard tabsCount != nextIndex else {
            return nil
        }
        guard tabsCount > nextIndex else {
            return nil
        }
        
        return infoTabsArray[nextIndex]
    }
    
    //need for dots
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return infoTabsArray.count
    }
    
    //need for dots
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstTab = viewControllers?.first, firstTabIndex = infoTabsArray.indexOf(firstTab) else {
            return 0
        }
        return firstTabIndex
    }
    
}