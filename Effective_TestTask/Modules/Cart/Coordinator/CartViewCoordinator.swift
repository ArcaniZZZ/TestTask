//
//  CartViewCoordinator.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import SwiftUI

final class CartViewCoordinator: Coordinator {

    // MARK: - Properties
    
    var rootViewController = UIViewController()
    
    private let viewModel: CartView.ViewModel
    

    // MARK: - Init
    
    init(viewModel: CartView.ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Coordinator Protocol
    
    func start() {
        let view = CartView(viewModel: viewModel)
        rootViewController = CommonHostingViewController(wrappedView: .cart, rootView: view)
    }
}
