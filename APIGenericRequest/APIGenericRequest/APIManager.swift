//
//  APIManager.swift
//  APIGenericRequest
//
//  Created by Luca D'Alberti on 5/31/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    private let baseAPIUrl = "http://localhost"
    
    static let sharedManager = APIManager()
    
    func requestResource<T: JSONDecodable>(endpoint endpoint: APIEndpoint, completionHandler: (T?, NSError?) -> Void) {
        
        Alamofire.request(
            endpoint.alamofireMethod,
            endpoint.completeURL,
            parameters: nil,
            encoding: .URL,
            headers: nil
        ).validate()
        .responseJSON { (let response) in
            
            switch response.result {
                
            case .Success(let json):
                
                guard
                    let json = json as? [String : AnyObject],
                    let item = T.from(json: json) else {
                    
                    completionHandler(
                        nil,
                        .GenericError
                    )
                        
                    return
                }
                
                completionHandler(
                    item as? T,
                    nil
                )
                
            case .Failure(let error):
                
                completionHandler(
                    nil,
                    error
                )
            }
        }
    }
    
    func requestSetOfResources<T where T: JSONDecodable>(endpoint endpoint: APIEndpoint, completionHandler: ([T]?, NSError?) -> Void) {
        
        Alamofire.request(
            endpoint.alamofireMethod,
            endpoint.completeURL,
            parameters: nil,
            encoding: .URL,
            headers: nil
        ).validate()
        .responseJSON { (let response) in
            
            switch response.result {
                
            case .Success(let json):
                
                guard let json = json as? [[String : AnyObject]] else {
                    
                    completionHandler(
                        nil,
                        .GenericError
                    )
                    
                    return
                }
                
                completionHandler(
                    json.flatMap { T.from(json: $0) as? T },
                    nil
                )
                
            case .Failure(let error):
                
                completionHandler(
                    nil,
                    error
                )
            }
        }
    }
}

// MARK: - Our NSError builder
private extension NSError {
    
    static var GenericError : NSError {
        
        return NSError(
            domain: "APIManager",
            code: -1,
            userInfo: [
                NSLocalizedDescriptionKey : "Something bad happened"
            ]
        )
    }
}


// MARK: - URL Builder
private extension APIEndpoint {
    
    var completeURL : NSURL {
        
        let apiURL = NSURL(string: APIManager.sharedManager.baseAPIUrl)!
        
        return apiURL.URLByAppendingPathComponent(path)
    }
}

// MARK: - Alamofire compatibility
private extension APIEndpoint {
    
    var alamofireMethod : Alamofire.Method {
        
        switch self {
            
        case .Me(_), .MyMessages(_):
            
            return .GET
        }
    }
}