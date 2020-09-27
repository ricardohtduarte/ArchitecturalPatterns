//
//  SceneDelegate.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 18/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = HomeViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

