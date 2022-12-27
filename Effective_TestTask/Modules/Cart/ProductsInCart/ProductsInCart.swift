//
//  ProductsInCart.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import Combine

final class ProductsInCart: ObservableObject {
    
    // MARK: - Properties
    
    @Published var products: [Product] = []
    

    // MARK: - Public Methods
    
    func addProductToCart(_ product: Product) {
        products.append(product)
    }
    
    func removeProductFromCart(_ product: Product) {
        if let productIndex = products.firstIndex(of: product) {
            products.remove(at: productIndex)
        }
    }
}
