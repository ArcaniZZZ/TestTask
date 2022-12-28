//
//  HomeView + ViewModel.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

import SwiftUI
import Combine

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
        
        @Published var mainScreenModel: MainScreen?
        @Published var chosenProduct: Product?
        @Published private var categoriesModel = createCategories()
        
        var categories: Array<Categories<CategoryType>.Category> {
            categoriesModel.categories
        }
        
        var numberOfProductsInCart = 0
        
        private weak var coordinator: MainFlowCoordinator?
        private var subscriptions = Set<AnyCancellable>()
        private let cartManager: CartManagerProtocol
        private let requestManager: RequestManagerProtocol
        
        
        // MARK: - Init
        
        init(
            requestManager: RequestManagerProtocol = ManagerFactory.shared.requestManager,
            cartManager: CartManagerProtocol = ManagerFactory.shared.cartManager,
            coordinator: MainFlowCoordinator
        ) {
            self.cartManager = ManagerFactory.shared.cartManager
            self.requestManager = ManagerFactory.shared.requestManager
            self.coordinator = coordinator
        }
        
        
        // MARK: - Public Methods
        
        func didChooseCategory(_ category: Categories<CategoryType>.Category) {
            categoriesModel.didChooseCategory(category)
        }
        
        @MainActor
        func viewIsReady() async throws {
            setupCartSubscriber()
            mainScreenModel = try await requestManager.perform(HomeViewRequest())
        }
        
        func didChooseProduct() {
            coordinator?.openDetailModule()
        }
        
        func didTapTabBarCartButton() {
            coordinator?.openCartModule()
        }
        
        
        // MARK: - Private Methods
        
        private func setupCartSubscriber() {
            cartManager.productsInCartPublisher
                .subscribe(on: DispatchQueue.main)
                .sink { [weak self] products in
                    self?.numberOfProductsInCart = products.count
                }
                .store(in: &subscriptions)
        }
        
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
