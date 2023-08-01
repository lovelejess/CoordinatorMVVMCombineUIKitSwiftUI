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
        setupOnboardingValue()
        hasSeenOnBoarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
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

    func setupOnboardingValue() {
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnBoarding.send(value)

        hasSeenOnBoarding
            .filter({$0})
            .sink { (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }.store(in: &subscriptions)
    }
}
