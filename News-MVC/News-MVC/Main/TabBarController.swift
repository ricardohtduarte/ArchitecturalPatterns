//
//  ViewController.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 18/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = HomeViewController()
        let everythingViewController = EverythingViewController()
        let sourcesViewController = SourcesViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "1"), tag: 0)
        everythingViewController.tabBarItem = UITabBarItem(title: "Everything", image: UIImage(named: "1"), tag: 1)
        sourcesViewController.tabBarItem = UITabBarItem(title: "Sources", image: UIImage(named: "1"), tag: 2)
        setViewControllers([homeViewController, everythingViewController, sourcesViewController],
                           animated: true)
    }
}

