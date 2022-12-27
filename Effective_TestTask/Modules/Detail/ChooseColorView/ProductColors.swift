//
//  ProductColors.swift
//  Effective_TestTask
//
//  Created by Arcani on 26.12.2022.
//

struct ProductColors {
    
    // MARK: - Types
    
    struct ProductColor: Hashable {
        let hex: String
        var isChosen: Bool = false
    }
    
    
    // MARK: - Properties
    
    private(set) var productColors: [ProductColor]
    
    
    // MARK: - Init
    
    init(productColors: [String]) {
        self.productColors = productColors.map {
            ProductColor(hex: $0)
        }
    }

    
    // MARK: - Public Methods
    
    mutating func selectFirstColor() {
        guard !productColors.isEmpty else {
            return
        }
        productColors[0].isChosen = true
    }
    
    mutating func didChooseColor(_ hex: String) {
        
        for index in productColors.indices {
            productColors[index].isChosen = false
        }
        
        if let index = productColors.firstIndex(where: { $0.hex == hex }) {
            productColors[index].isChosen = true
        }
    }
}
