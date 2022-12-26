//
//  MainScreenRequest.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

struct HomeViewRequest: RequestProtocol {
    
    var path: String {
        Constants.Networking.homeScreenRequestPath
    }
    
    var requestType: RequestType {
        .GET
    }
    
}
