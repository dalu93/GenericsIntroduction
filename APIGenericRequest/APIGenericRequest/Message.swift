//
//  Message.swift
//  APIGenericRequest
//
//  Created by Luca D'Alberti on 5/31/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import Foundation

struct Message {
    
    let id : String
    
    let senderId : String
    
    let receiverId : String
    
    let text : String
    
    init(id: String, senderId: String, receiverId: String, text: String) {
        
        self.id = id
        
        self.senderId = senderId
        
        self.receiverId = receiverId
        
        self.text = text
    }
}

// MARK: - JSONDecodable
extension Message : JSONDecodable {
    
    typealias T = Message
    
    static func from(json json: [String : AnyObject]) -> T? {
        
        guard
            let id = json["id"] as? String,
            let senderId = json["senderId"] as? String,
            let receiverId = json["receiverId"] as? String,
            let text = json["text"] as? String else {
            
            return nil
        }
        
        return Message(
            id: id,
            senderId: senderId,
            receiverId: receiverId,
            text: text
        )
    }
}

extension Message : Hashable {
    
    var hashValue : Int { return 0 }
}

extension Message : Equatable {}

func ==(lhs: Message, rhs: Message) -> Bool {
    
    return lhs.id == rhs.id
}