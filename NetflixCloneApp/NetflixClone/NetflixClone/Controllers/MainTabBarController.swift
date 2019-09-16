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
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.8980392157, green: 0.03921568627, blue: 0.07450980392, alpha: 1), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        viewController.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return navController
    }
    
}

