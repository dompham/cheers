//
//  TabBarViewController.swift
//  Cheers
//
//  Created by Do Pham on 5/21/18.
//  Copyright © 2018 Do Pham. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase


class TabBarViewController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            let homeVC = HomeDatasourceController()
            let exploreVC = ExploreViewController()
            let cheersVC = CheersViewController()
            let honorsVC = HonorsViewController()
            let profileVC = ProfileViewController()
            
            let homeNavController = UINavigationController(rootViewController: homeVC)
            
            homeVC.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "homeGray"), selectedImage: #imageLiteral(resourceName: "home"))
            exploreVC.tabBarItem = UITabBarItem(title: "Explore", image: #imageLiteral(resourceName: "compassGray"), selectedImage: #imageLiteral(resourceName: "compass"))
            cheersVC.tabBarItem = UITabBarItem(title: "Cheers", image: #imageLiteral(resourceName: "cheersGrayIcon"), selectedImage: #imageLiteral(resourceName: "cheersMainIcon"))
            honorsVC.tabBarItem = UITabBarItem(title: "Honors", image: #imageLiteral(resourceName: "honorsGray"), selectedImage: #imageLiteral(resourceName: "honors"))
            profileVC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profileGray"), selectedImage: #imageLiteral(resourceName: "profile"))
            
            
            self.viewControllers = [homeNavController, exploreVC, cheersVC, honorsVC, profileVC]
            logService.log(volume: 2, say: "TabBarController has loaded")
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
