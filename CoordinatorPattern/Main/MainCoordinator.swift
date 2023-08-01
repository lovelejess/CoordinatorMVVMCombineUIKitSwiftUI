//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinatable {

    var rootViewController: UITabBarController
    var childCoordinators = [Coordinatable]()
    
    init() {
        rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }

    func start() {
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        childCoordinators.append(firstCoordinator)
        let firstViewController = firstCoordinator.rootViewController
        setup(vc: firstViewController, title: "First", imageName: "plus.circle", selectedImageName: "plus.circle.fill")
        firstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "plus.circle"), selectedImage: UIImage(systemName: "plus.circle.fill"))

        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        childCoordinators.append(secondCoordinator)
        let secondViewController = secondCoordinator.rootViewController
        setup(vc: secondViewController, title: "Second", imageName: "minus.circle", selectedImageName: "minus.circle.fill")

        rootViewController.viewControllers = [firstViewController, secondViewController]
    }

    func setup(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
