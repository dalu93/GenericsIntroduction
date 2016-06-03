//
//  APIEndpoint.swift
//  APIGenericRequest
//
//  Created by Luca D'Alberti on 5/31/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import Foundation

enum APIEndpoint {
    
    case Me(token: String)
    case MyMessages(token: String)
    
    var path    : String { return configurationStruct().path }
    var method  : String { return configurationStruct().method }
}

private struct EndpointStruct {
    
    let path : String
    
    let method : String
    
    init(path: String, method: String) {
        
        self.path = path
        
        self.method = method
    }
}

// MARK: - Struct builder
private extension APIEndpoint {
    
    private func configurationStruct() -> EndpointStruct {
        
        switch self {
            
        case .Me(let token):
            
            return EndpointStruct(
                path: "/me?access_token=\(token)",
                method: "GET"
            )
            
        case .MyMessages(let token):
            
            return EndpointStruct(
                path: "/messages?access_token=\(token)",
                method: "GET"
            )
        }
    }
}