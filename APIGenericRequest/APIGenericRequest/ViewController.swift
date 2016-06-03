//
//  ViewController.swift
//  APIGenericRequest
//
//  Created by Luca D'Alberti on 5/31/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let myToken = "dfisgi348"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let model : Connector<User> = Connector()
        
        //MARK: - Request User
        model.getItem { (let user, let error) in
            
        }
        
        // MARK: - Request Messages
        APIManager.sharedManager.requestSetOfResources(
        endpoint: APIEndpoint.MyMessages(token: myToken)) { (let messages: [Message]?, let error) in
            
            if let _ = error {
                
                // handle error
                return
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

