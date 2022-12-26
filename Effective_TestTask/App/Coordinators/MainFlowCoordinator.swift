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
    
    let homeViewViewModel = HomeView.ViewModel(requestManager: RequestManager())
    
    
    // MARK: - Coordinator Protocol
    
    func start() {
        
        homeViewViewModel.didChooseProductAction = didChooseProduct
        
        let homeViewCoordinator = HomeViewCoordinator(homeViewViewModel: homeViewViewModel)
        
        homeViewCoordinator.start()
        childCoordinators.append(homeViewCoordinator)
        
        let viewController = homeViewCoordinator.rootViewController
        rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    func didChooseProduct() {
        let detailView = DetailView(viewModel: .init(requestManager: RequestManager()))
        let viewController = UIHostingController(rootView: detailView)
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    
}

