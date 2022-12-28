//
//  CartView + ViewModel.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import SwiftUI
import Combine

extension CartView {
    
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties
        
        @Published var total: Int = 0
        @Published var deliveryPrice = ""
        @Published var productsInCart = [CartProduct]()
        
        private weak var coordinator: MainFlowCoordinator?
        private var subscriptions = Set<AnyCancellable>()
        private let cartManager: CartManagerProtocol
        private let requestManager: RequestManagerProtocol
        
    
        // MARK: - Init
        
        init(
            requestManager: RequestManagerProtocol = ManagerFactory.shared.requestManager,
            cartManager: CartManagerProtocol = ManagerFactory.shared.cartManager,
            coordinator: MainFlowCoordinator
            
        ) {
            self.requestManager = requestManager
            self.cartManager = cartManager
            self.coordinator = coordinator
        }
        
        
        // MARK: - Public Methods
        
        func viewIsReady() async throws {
            try await fetchProductsInCart()
        }
        
        
        // MARK: - Private Methods
        
        @MainActor
        private func fetchProductsInCart() async throws {
            if let cart: Cart = try await requestManager.perform(CartViewRequest()) {
                total = cart.total
                deliveryPrice = cart.delivery
                productsInCart = cart.basket
            }
        }

    }
}
