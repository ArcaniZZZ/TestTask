//
//  MainFlowCoordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

final class MainFlowCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var rootViewController = UINavigationController()
    
    var childCoordinators = [Coordinator]()
    
    
    // MARK: - Coordinator Protocol
    
    func start() {
        let homeViewViewModel = HomeView.ViewModel(requestManager: RequestManager())
        homeViewViewModel.didChooseProductAction = didChooseProduct
        
        let homeViewCoordinator = HomeViewCoordinator(homeViewViewModel: homeViewViewModel)
        homeViewCoordinator.start()
        
        childCoordinators.append(homeViewCoordinator)
        
        let viewController = homeViewCoordinator.rootViewController
        rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    func didChooseProduct() {
        let detailViewModel = DetailView.ViewModel(requestManager: RequestManager())
    
        let detailViewCoordinator = DetailViewCoordinator(
            detailViewModel: detailViewModel,
            navigationAction: openCartModule
        )
        detailViewCoordinator.start()
        
        childCoordinators.append(detailViewCoordinator)
        
        let viewController = detailViewCoordinator.rootViewController
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    private func openCartModule() {
        let cartCoordinator = CartViewCoordinator()
        cartCoordinator.start()
        
        childCoordinators.append(cartCoordinator)
        
        let viewController = cartCoordinator.rootViewController
        rootViewController.pushViewController(viewController, animated: true)
    }
}
