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

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        window.rootViewController = UIHostingController(rootView: ContentView())
    }
}
