//
//  FeaturedProduct.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

struct FeaturedProduct: Codable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool
}
