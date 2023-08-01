//
//  OnboardingCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Foundation
import SwiftUI

class OnboardingCoordinator: Coordinatable {

    var rootViewController = UIViewController()

    func start() {
        let view = OnboardingView {

        }
        rootViewController = UIHostingController(rootView: view)
    }
}
