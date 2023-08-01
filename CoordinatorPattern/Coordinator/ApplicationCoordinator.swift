//
//  ApplicationCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Foundation
import SwiftUI
import UIKit

class ApplicationCoordinator: Coordinatable {

    let window: UIWindow
    var childCoordinators = [Coordinatable]()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let onboardingCoordinator = OnboardingCoordinator()
        onboardingCoordinator.start()
        self.childCoordinators = [onboardingCoordinator]
        window.rootViewController = onboardingCoordinator.rootViewController
    }
}
