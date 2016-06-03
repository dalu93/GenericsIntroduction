//
//  Connector.swift
//  APIGenericRequest
//
//  Created by Luca D'Alberti on 6/1/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import Foundation


class Connector<T where T: JSONDecodable> {
    
    func getItem(handler: (T?, NSError?) -> Void) {
        
        APIManager.sharedManager.requestResource(
        endpoint: APIEndpoint.Me(token: "sfdhdfu")) { (item : T?, error) in
            
            handler(item, error)
        }
    }
    
    func getItems(handler: ([T]?, NSError?) -> Void) {
        
        APIManager.sharedManager.requestSetOfResources(
        endpoint: APIEndpoint.MyMessages(token: "fuahdfuadf")) { (items : [T]?, error) in
            
            handler(items, error)
        }
    }
}