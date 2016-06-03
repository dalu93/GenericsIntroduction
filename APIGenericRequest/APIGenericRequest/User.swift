//
//  User.swift
//  APIGenericRequest
//
//  Created by Luca D'Alberti on 5/31/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import Foundation

struct User {
    
    let id : String
    
    let username : String
    
    let email : String
    
    init(id: String, username: String, email: String) {
        
        self.id = id
        
        self.username = username
        
        self.email = email
    }
}

// MARK: - JSONDecodable
extension User : JSONDecodable {
    
    typealias T = User
    
    static func from(json json: [String : AnyObject]) -> T? {
        
        guard
            let id = json["id"] as? String,
            let username = json["username"] as? String,
            let email = json["email"] as? String else {
                
                return nil
        }
        
        return User(
            id: id,
            username: username,
            email: email
        )
    }
}