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
        
        @Published
        var product: Product?
        
        @ObservedObject
        private var productsInCart: ProductsInCart
        
        var productColors: [ProductColor]? {
            productColorsModel?.productColors
        }
        
        var productCapacities: [Capacity]? {
            memoryCapacitiesModel?.productCapacities
        }
        
        private var productColorsModel: ProductColors?
        private var memoryCapacitiesModel: ProductCapacities?
        
        private let requestManager: RequestManagerProtocol
        
        
        // MARK: - Init
        
        init(
            requestManager: RequestManagerProtocol,
            productsInCart: ProductsInCart
        ) {
            self.productsInCart = productsInCart
            self.requestManager = requestManager
        }
        
        
        // MARK: - Public Methods
        
        func didChooseColor(_ hex: String) {
            productColorsModel?.didChooseColor(hex)
        }
        
        func didChooseCapacity(_ capacity: String) {
            memoryCapacitiesModel?.didChooseCapacity(capacity)
        }
        
        func didTapAddToCartButton() {
            guard let product else {
                return
            }
            productsInCart.addProductToCart(product)
        }
        
        //        func selectFirstColor() {
        //            productColorsModel?.selectFirstColor()
        //        }
        
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
