//
//  RequestManager.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

import Foundation

protocol RequestManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager {
    
    // MARK: - Properties
    
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol
    
    
    // MARK: - Init
    
    init(
        apiManager: APIManagerProtocol = APIManager(),
        parser: DataParserProtocol = DataParser()
    ) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
}


//MARK: - RequestManagerProtocol
extension RequestManager: RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }

}
