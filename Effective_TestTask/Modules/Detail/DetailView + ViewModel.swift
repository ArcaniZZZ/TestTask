//
//  DetailView + ViewModel.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

extension DetailView {
    
    final class ViewModel: ObservableObject {
        
        // MARK: - Type aliases
        
        typealias ProductColor = ProductColors.ProductColor
        
        
        // MARK: - Properties
        
        @Published
        var product: Product?
        
        @Published
        private var productColorsModel: ProductColors?
        
        var productColors: [ProductColor]? {
            productColorsModel?.productColors
        }
        
        private let requestManager: RequestManagerProtocol
        
        
        // MARK: - Init
        
        init(requestManager: RequestManagerProtocol) {
            self.requestManager = requestManager
        }
        
        
        // MARK: - Public Method
        
        func didChooseColor(_ hex: String) {
            productColorsModel?.didChooseColor(hex)
        }
        
        func selectFirstColor() {
            productColorsModel?.selectFirstColor()
        }
        
        @MainActor
        func fetchProduct() async throws {
            do {
                product = try await requestManager.perform(DetailViewRequest())
                productColorsModel = createColorButtons(product?.color ?? [])
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
        
    }

}
