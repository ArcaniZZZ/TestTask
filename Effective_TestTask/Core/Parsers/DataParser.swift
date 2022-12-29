//
//  DataParser.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

import Foundation

protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}

class DataParser {
    
    // MARK: - Properties
    
    private var jsonDecoder: JSONDecoder
    
    
    // MARK: - Init
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
}


// MARK: - DataParserProtocol
extension DataParser: DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T {
        try jsonDecoder.decode(T.self, from: data)
    }
}


