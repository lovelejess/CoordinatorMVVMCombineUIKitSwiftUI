//
//  FirstTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Foundation
import SwiftUI
import UIKit

class FirstTabCoordinator: Coordinatable {

    var rootViewController: UINavigationController
    let viewModel = FirstTabViewModel()

    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }

    lazy var firstViewController: FirstViewController = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.loginViewRequested = { [weak self] in
            self?.goToLoginView()
        }

        vc.loginSubmitted = { [weak self] hasSubmitted in
            self?.rootViewController.popToRootViewController(animated: true)
        }

        vc.title = "First"
        return vc
    }()

    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }

    private func goToLoginView() {
        let loginViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(loginViewController, animated: true)
    }
}
