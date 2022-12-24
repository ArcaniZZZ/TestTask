//
//  ApplicationCoordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI
import Combine

final class ApplicationCoordinator: Coordinator {
  
    // MARK: - Properties
    
    var childCoordinators = [Coordinator]()
    var subscriptions = Set<AnyCancellable>()
    
    let window: UIWindow
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(true)
    
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: - CoordinatorProtocol
    
    func start() {
        hasSeenOnboarding.sink { [weak self] hasSeen in
            if hasSeen {
                let mainFlowCoordinator = MainFlowCoordinator()
                mainFlowCoordinator.start()
                self?.childCoordinators = [mainFlowCoordinator]
                self?.window.rootViewController = mainFlowCoordinator.rootViewController
            } else {
                // TODO: - Implement onboarding
                print("User has not seen onboarding yet")
            }
        }.store(in: &subscriptions)
    }
}
