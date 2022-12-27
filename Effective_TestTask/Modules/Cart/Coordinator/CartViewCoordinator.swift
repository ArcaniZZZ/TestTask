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
    

    // MARK: - Init
    

    // MARK: - Coordinator Protocol
    
    func start() {
        let view = CartView()
        rootViewController = CommonHostingViewController(wrappedView: .cart, rootView: view)
    }
}
