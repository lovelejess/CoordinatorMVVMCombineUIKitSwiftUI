//
//  SecondTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Foundation
import UIKit

class SecondTabCoordinator: Coordinatable {

    var rootViewController = UINavigationController()

    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()

    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
