//
//  ViewController.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 18/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let topHeadlinesViewController = TopHeadlinesViewController()
        let everythingViewController = EverythingViewController()
        let sourcesViewController = SourcesViewController()
        setViewControllers([topHeadlinesViewController, everythingViewController, sourcesViewController], animated: true)
    }
}

