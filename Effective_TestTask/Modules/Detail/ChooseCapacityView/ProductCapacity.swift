//
//  ProductCapacity.swift
//  Effective_TestTask
//
//  Created by Arcani on 26.12.2022.
//

struct ProductCapacities {
    
    // MARK: - Types
    
    struct Capacity: Hashable {
        let capacity: String
        var isChosen: Bool = false
    }
    
    
    // MARK: - Properties
    
    private(set) var productCapacities: [Capacity]
    
    
    // MARK: - Init
    
    init(productCapacities: [String]) {
        self.productCapacities = productCapacities.map {
            Capacity(capacity: $0)
        }
    }
    
    
    // MARK: - Public Methods
    
    mutating func selectFirstCapacity() {
        guard !productCapacities.isEmpty else {
            return
        }
        productCapacities[0].isChosen = true
    }
    
    mutating func didChooseCapacity(_ capacity: String) {
        
        for index in productCapacities.indices {
            productCapacities[index].isChosen = false
        }
        
        if let index = productCapacities.firstIndex(where: { $0.capacity == capacity }) {
            productCapacities[index].isChosen = true
        }
    }
}
