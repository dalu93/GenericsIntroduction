//
//  JSONDecodable.swift
//  APIGenericRequest
//
//  Created by Luca D'Alberti on 5/31/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    
    associatedtype T
    
    static func from(json json: [String : AnyObject]) -> T?
}