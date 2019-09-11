//
//  MainTabBarController.swift
//  NetflixClone
//
//  Created by Moe on 02/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createViewController("Home", image: UIImage(named: "home")!, viewController: HomeController()),
            createViewController("Search", image: UIImage(named: "search")!, viewController: SearchController()),
            createViewController("Downloads", image: UIImage(named: "download")!, viewController: UIViewController()),
            createViewController("More", image: UIImage(named: "menu")!, viewController: UIViewController())
        ]
        
        
    }

    func createViewController(_ title: String, image: UIImage, viewController: UIViewController) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.tabBarItem.image = image
        navController.tabBarItem.title = title
        
        navController.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        viewController.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return navController
    }
    
}

