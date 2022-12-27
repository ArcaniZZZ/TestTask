//
//  Categories.swift
//  Effective_TestTask
//
//  Created by Arcani on 16.12.2022.
//

import Foundation

struct Categories<CategoryType: Equatable> {
    
    // MARK: - Types
    
    struct Category: Identifiable {
        let id = UUID()
        let categoryType: CategoryType
        var isChosen = false
    }
    
    
    // MARK: - Properties
    
    private(set) var categories = Array<Category>()

    
    // MARK: - Init
    
    init(numberOfCategories: Int, createCategoryType: (Int) -> CategoryType) {
        for index in 0..<numberOfCategories {
            let categoryType = createCategoryType(index)
            categories.append(Category(categoryType: categoryType))
        }
    }
    
    
    // MARK: - Public Methods
    
    mutating func didChooseCategory(_ category: Category) {
        
        for index in categories.indices {
            categories[index].isChosen = false
        }
        
        if let index = categories.firstIndex(where: { $0.categoryType == category.categoryType }) {
            categories[index].isChosen = true
        }
    }
}
