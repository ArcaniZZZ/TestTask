//
//  DetailScreenRequest.swift
//  Effective_TestTask
//
//  Created by Arcani on 26.12.2022.
//

struct DetailViewRequest: RequestProtocol {
    
    var path: String {
        Constants.Networking.detailScreenRequestPath
    }
    
    var requestType: RequestType {
        .GET
    }
    
}
