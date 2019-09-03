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
            createViewController("Search", image: UIImage(named: "search")!, viewController: UIViewController()),
            createViewController("Downloads", image: UIImage(named: "download")!, viewController: UIViewController()),
            createViewController("More", image: UIImage(named: "menu")!, viewController: UIViewController())
        ]
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func createViewController(_ title: String, image: UIImage, viewController: UIViewController) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.tabBarItem.image = image
        navController.tabBarItem.title = title
        
        navController.navigationBar.barTintColor = .black
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        viewController.view.backgroundColor = #colorLiteral(red: 0.103221871, green: 0.10324689, blue: 0.1032185927, alpha: 1)
        
        return navController
    }
    
}

