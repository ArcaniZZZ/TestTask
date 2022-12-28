//
//  CartViewREquest.swift
//  Effective_TestTask
//
//  Created by Arcani on 28.12.2022.
//

struct CartViewRequest: RequestProtocol {
    
    var path: String {
        Constants.Networking.cartViewRequestPath
    }
    
    var requestType: RequestType {
        .GET
    }
}
