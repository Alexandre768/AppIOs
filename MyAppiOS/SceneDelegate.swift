//
//  SceneDelegate.swift
//  MyAppiOS
//
//  Created by user on 29/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScenne = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScenne)
        let navigation = UINavigationController(rootViewController: MoviesViewController())
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

