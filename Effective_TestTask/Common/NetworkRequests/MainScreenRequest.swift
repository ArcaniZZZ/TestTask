//
//  MainScreenRequest.swift
//  Effective_TestTask
//
//  Created by Arcani on 15.12.2022.
//

struct MainScreenRequest: RequestProtocol {
    
    var path: String {
        Constants.Networking.mainScreenRequestPath
    }
    
    var requestType: RequestType {
        .GET
    }
    
}
