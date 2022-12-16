//
//  HomeView + ViewModel.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

import SwiftUI

extension HomeView {
    
    final class ViewModel: ObservableObject {
        
        // MARK: - Types
        
        enum CategoryType: String, CaseIterable {
            case phones
            case computers
            case health
            case books
            case headphones
        }
        
        
        // MARK: - Properties
        
        @Published private var categoriesModel = createCategories()
        
        private let requestManager: RequestManagerProtocol
        
        
        // MARK: - Init
        
        init(requestManager: RequestManagerProtocol) {
            self.requestManager = requestManager
        }
        
  
        // MARK: - Public Methods
        
        static func createCategories() -> Categories<CategoryType> {
            let numberOfCategories = CategoryType.allCases.count
            return Categories(numberOfCategories: numberOfCategories) { categoryIndex in
                CategoryType.allCases[categoryIndex]
            }
        }
        
        func didChooseCategory(_ category: Categories<CategoryType>.Category) {
            categoriesModel.didChooseCategory(category)
        }
        
        var categories: Array<Categories<CategoryType>.Category> {
            categoriesModel.categories
        }
        
    }
    
}
