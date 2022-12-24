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
        
        @Published
        var mainScreenModel: MainScreen?
        
        @Published
        var chosenProduct: Product?
        
        @Published
        private var categoriesModel = createCategories()
        
        var categories: Array<Categories<CategoryType>.Category> {
            categoriesModel.categories
        }
        
        var didChooseProductAction: SimpleClosure?
        
        private let requestManager: RequestManagerProtocol
        
        
        // MARK: - Init
        
        init(requestManager: RequestManagerProtocol) {
            self.requestManager = requestManager
        }
        
        
        // MARK: - Public Methods
        
        func didChooseCategory(_ category: Categories<CategoryType>.Category) {
            categoriesModel.didChooseCategory(category)
        }
        
        @MainActor
        func viewIsReady() async throws {
            mainScreenModel = try await requestManager.perform(MainScreenRequest())
        }
        
        
        // MARK: - Private Methods
        
        private static func createCategories() -> Categories<CategoryType> {
            let numberOfCategories = CategoryType.allCases.count
            return Categories(numberOfCategories: numberOfCategories) { categoryIndex in
                CategoryType.allCases[categoryIndex]
            }
        }
        
        private func didChooseBestSeller(_ bestSeller: BestSeller) {
            
        }
    }
}
