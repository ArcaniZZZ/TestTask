//
//  DetailView + ViewModel.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI
import Combine

extension DetailView {
    
    final class ViewModel: ObservableObject {
        
        // MARK: - Type aliases
        
        typealias ProductColor = ProductColors.ProductColor
        typealias Capacity = ProductCapacities.Capacity
        
        
        // MARK: - Properties
        
        @Published var product: Product?
        @Published private var productColorsModel: ProductColors?
        @Published private var memoryCapacitiesModel: ProductCapacities?
        
        var productColors: [ProductColor]? {
            productColorsModel?.productColors
        }
        var productCapacities: [Capacity]? {
            memoryCapacitiesModel?.productCapacities
        }
        
        private weak var coordinator: MainFlowCoordinator?
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
        
        func didChooseColor(_ hex: String) {
            productColorsModel?.didChooseColor(hex)
        }
        
        func didChooseCapacity(_ capacity: String) {
            memoryCapacitiesModel?.didChooseCapacity(capacity)
        }
        
        func didTapAddToCartButton() {
            if let product {
                cartManager.addProductToCart(product)
            }
        }
        
        @MainActor
        func fetchProduct() async throws {
            do {
                product = try await requestManager.perform(DetailViewRequest())
                productColorsModel = createColorButtons(product?.color ?? [])
                memoryCapacitiesModel = createCapacityButtons(capacities: product?.capacity ?? [])
            } catch {
                print("Error decoding DetailView model")
            }
        }
        
        
        // MARK: - Private Methods
        
        private func createColorButtons(_ colors: [String]) -> ProductColors {
            var colors = ProductColors(productColors: colors)
            colors.selectFirstColor()
            return colors
        }
        
        private func createCapacityButtons(capacities: [String]) -> ProductCapacities {
            var capacities = ProductCapacities(productCapacities: capacities)
            capacities.selectFirstCapacity()
            return capacities
        }
    }
}
