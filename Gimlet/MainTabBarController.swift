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
        firstcontroller.tabBarItem.image = UIImage(named: "recent")
        let secondController = AllSubredditViewController()
        secondController.tabBarItem.image = UIImage(named: "subreddits")
        let thirdController = ProfileViewController()
        thirdController.tabBarItem.image = UIImage(named: "profile")
        let tabBarList = [firstcontroller, secondController, thirdController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0)
        }
        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    

}
