//
//  SceneDelegate.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var appCoordinator: ApplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            self.appCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }
}

