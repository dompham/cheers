//
//  TabBarViewController.swift
//  Cheers
//
//  Created by Do Pham on 5/21/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = ExploreViewController()
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        let viewControllerList = [ homeVC ]
        viewControllers = viewControllerList
        
    }
}
