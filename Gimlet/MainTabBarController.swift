//
//  MainTabBarController.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-10-29.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        
        
    
       
    }
    
    func setupTabBar() {
        let firstcontroller = PopularPostViewController()
        firstcontroller.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        let secondController = AllSubredditViewController()
        secondController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        let thirdController = ProfileViewController()
        thirdController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        let tabBarList = [firstcontroller, secondController, thirdController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0)
        }
    }
    

}
