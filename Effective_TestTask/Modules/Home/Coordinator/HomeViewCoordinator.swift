//
//  HomeViewCoordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

final class HomeViewCoordinator: Coordinator {

    // MARK: - Properties
    
    var rootViewController = UIViewController()
    
    private let homeViewViewModel: HomeView.ViewModel
    
    
    // MARK: - Init
    
    init(homeViewViewModel: HomeView.ViewModel) {
        self.homeViewViewModel = homeViewViewModel
    }
    

    // MARK: - Coordinator Protocol
    
    func start() { 
        let view = HomeView(viewModel: self.homeViewViewModel)
        rootViewController = UIHostingController(rootView: view)
    }
}
