//
//  ManagerFactory.swift
//  Effective_TestTask
//
//  Created by Arcani on 28.12.2022.
//

import Foundation

class ManagerFactory {
    
    // MARK: - Properties
    
    static let shared = ManagerFactory()
    
    lazy var cartManager = CartManager.shared
    lazy var requestManager = RequestManager()
    
    
    // MARK: - Init
    
    private init() {}
}
