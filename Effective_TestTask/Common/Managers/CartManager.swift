//
//  CartManager.swift
//  Effective_TestTask
//
//  Created by Arcani on 28.12.2022.
//

import Combine

protocol CartManagerProtocol {
    var productsInCartPublisher: CurrentValueSubject<[Product], Never> { get }
    func addProductToCart(_ product: Product)
}


final class CartManager: CartManagerProtocol {

    // MARK: - Properties
    
    static let shared = CartManager()
    var productsInCartPublisher = CurrentValueSubject<[Product], Never>([])
    private var productsInCart = [Product]()
    
    // MARK: - Init
    
    private init() {}
    
    
    // MARK: - Public Methods
    
    func addProductToCart(_ product: Product) {
        productsInCart.append(product)
        productsInCartPublisher.send(productsInCart)
    }
}
