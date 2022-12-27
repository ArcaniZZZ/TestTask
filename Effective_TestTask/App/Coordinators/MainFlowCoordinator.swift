//
//  MainFlowCoordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI
import Combine

final class MainFlowCoordinator: Coordinator {
    
    // MARK: - Properties
    
    @ObservedObject
    private var productsInCart = ProductsInCart()
    
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
        let detailViewModel = DetailView.ViewModel(
            requestManager: RequestManager(),
            productsInCart: productsInCart)
    
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
        let cartViewModel = CartView.ViewModel(productsInCart: productsInCart)
        
        let cartCoordinator = CartViewCoordinator(viewModel: cartViewModel)
        cartCoordinator.start()
        
        childCoordinators.append(cartCoordinator)
        
        let viewController = cartCoordinator.rootViewController
        rootViewController.pushViewController(viewController, animated: true)
    }
}
