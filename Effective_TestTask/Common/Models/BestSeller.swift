//
//  BestSeller.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

struct BestSeller: Codable, Hashable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String
}
