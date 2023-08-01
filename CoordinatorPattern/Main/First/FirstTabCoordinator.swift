//
//  FirstTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Foundation
import UIKit

class FirstTabCoordinator: Coordinatable {

    var rootViewController = UINavigationController()

    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.title = "First"
        return vc
    }()

    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
}
