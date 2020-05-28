//
//  Post.swift
//  TableFromNet
//
//  Created by Антон Петренко on 02.12.2019.
//  Copyright © 2019 Антон Петренко. All rights reserved.
//

import Foundation

class Post: Codable {
    var userId: Int
    var Id: Int
    var title: String
    var body: String
    
    init(userId: Int, title: String, body: String) {
        self.title = title
        self.body = body
        self.userId = userId
        self.Id = 0
    }
}
