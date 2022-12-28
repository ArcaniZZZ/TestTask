//
//  Cart.swift
//  Effective_TestTask
//
//  Created by Arcani on 28.12.2022.
//

struct Cart: Codable {
    let basket: [CartProduct]
    let delivery, id: String
    let total: Int
}

struct CartProduct: Codable, Hashable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
