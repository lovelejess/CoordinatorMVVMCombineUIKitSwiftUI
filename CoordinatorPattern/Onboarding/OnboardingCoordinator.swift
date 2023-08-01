//
//  OnboardingCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Combine
import Foundation
import SwiftUI

class OnboardingCoordinator: Coordinatable {

    var rootViewController = UIViewController()
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>

    init(hasSeenOnBoarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnBoarding
    }

    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)
    }
}
