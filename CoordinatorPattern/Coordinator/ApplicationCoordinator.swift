//
//  ApplicationCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jess Lê on 8/1/23.
//

import Combine
import Foundation
import SwiftUI
import UIKit

class ApplicationCoordinator: Coordinatable {

    let window: UIWindow
    var childCoordinators = [Coordinatable]()
    
    let hasSeenOnBoarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        hasSeenOnBoarding.sink { [weak self] hasSeen in
            guard let self = self else { return }
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self.childCoordinators = [mainCoordinator]
                self.window.rootViewController = mainCoordinator.rootViewController
            } else {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnBoarding: self.hasSeenOnBoarding)
                onboardingCoordinator.start()
                self.childCoordinators = [onboardingCoordinator]
                self.window.rootViewController = onboardingCoordinator.rootViewController
            }
        }.store(in: &subscriptions)
    }
}
