//
//  Product.swift
//  Effective_TestTask
//
//  Created by Arcani on 21.12.2022.
//

struct Product: Codable, Hashable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}
