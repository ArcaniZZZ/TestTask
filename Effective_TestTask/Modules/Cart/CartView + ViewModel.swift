//
//  CartView + ViewModel.swift
//  Effective_TestTask
//
//  Created by Arcani on 27.12.2022.
//

import SwiftUI

extension CartView {
    
    final class ViewModel: ObservableObject {
        
        @ObservedObject
        private var productsInCart: ProductsInCart
        
        var productsCount: Int {
            productsInCart.products.count
        }
        
        init(productsInCart: ProductsInCart) {
            self.productsInCart = productsInCart
        }
        
    }

}
