//
//  Post.swift
//  JSONParse
//
//  Created by Admin  on 11/25/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import Foundation

class Post {
    
    let userID: Int
    let title: String
    let body: String?
    
    init?(attributes: [String: Any]){
        
        guard let actualUserID = attributes["userId"] as? Int,
        let actualTitle = attributes["title"] as? String else {
            return nil
        }
        
        self.userID = actualUserID
        self.title = actualTitle
        self.body = attributes["body"] as? String
    }
}
