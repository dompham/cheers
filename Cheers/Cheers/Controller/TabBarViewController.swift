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
        let tab1 = HomeDatasourceController()
        let tab2 = CheersViewController()
        let homeNavController = UINavigationController(rootViewController: tab1)
        
        tab1.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        tab2.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        viewControllers = [homeNavController, tab2]
        
    }
}
