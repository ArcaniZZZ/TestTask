//
//  NetworkError.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

import Foundation

enum NetworkError: Error {
    
    case invalidURL
    case invalidServerResponse
    
    var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "The server returned an invalid response."
        case .invalidURL:
            return "URL string is malformed."
        }
    }
    
}
