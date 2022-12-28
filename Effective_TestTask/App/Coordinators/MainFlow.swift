//
//  MainFlowCoordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

final class MainFlow: MainFlowCoordinator {
    
    // MARK: - Properties
    
    lazy var rootViewController = UINavigationController()

    
    // MARK: - MainFlowCoordinator
    
    func start() {
        let view = HomeView(viewModel: .init(coordinator: self))
        let viewController = CommonHostingViewController(wrappedView: .home, rootView: view)
        rootViewController.setViewControllers([viewController], animated: false)
    }
    
    func openDetailModule() {
        let view = DetailView(viewModel: .init(coordinator: self))
        let viewController = CommonHostingViewController(
            wrappedView: .detail(navigationAction: openCartModule),
            rootView: view
        )
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    func openCartModule() {
        let view = CartView(viewModel: .init(coordinator: self))
        let viewController = CommonHostingViewController(wrappedView: .cart, rootView: view)
        rootViewController.pushViewController(viewController, animated: true)
    }
}
