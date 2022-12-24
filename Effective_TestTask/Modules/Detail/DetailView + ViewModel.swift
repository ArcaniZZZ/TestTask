//
//  DetailView + ViewModel.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

import SwiftUI

extension DetailView {
    
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties
        
        let product: Product
        
        
        // MARK: - Init
        
        init(product: Product) {
            self.product = product
        }
        
    }

}
