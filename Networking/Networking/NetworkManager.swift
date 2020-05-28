//
//  NetworkManager.swift
//  Networking
//
//  Created by Антон Петренко on 01.12.2019.
//  Copyright © 2019 Антон Петренко. All rights reserved.
//

import Foundation

class NetworkManager {
    
    func getAllPosts(_ complitionHandler: @escaping ([Post]) -> Void) {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
                  URLSession.shared.dataTask(with: url) { (data, response, error) in
                      
                      if error != nil {
                          print("Error in request!")
                      } else {
                          if let resp = response as? HTTPURLResponse, resp.statusCode == 200, let responseData = data {
                              
                              let posts = try? JSONDecoder().decode([Post].self, from: responseData)
                            
                            complitionHandler(posts ?? [])
                            
                          }
                          print(response)
                      }
                      
                  }.resume()
              }
    }
}
