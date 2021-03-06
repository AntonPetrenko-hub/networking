//
//  NetworkManager.swift
//  TableFromNet
//
//  Created by Антон Петренко on 02.12.2019.
//  Copyright © 2019 Антон Петренко. All rights reserved.
//

import Foundation

class NetworkManager {
    
    enum HTTPMethod: String {
        case POST
        case PUT
        case GET
        case DELETE
    }
    
    enum APIs: String {
        case posts
        case users
        case comments
    }
    
    private let baseURL = "http://jsonplaceholder.typicode.com/"
    
    func getAllPosts(_ complitionHandler: @escaping ([Post]) -> Void) {
        if let url = URL(string: baseURL + APIs.posts.rawValue) {
                  URLSession.shared.dataTask(with: url) { (data, response, error) in
                      
                      if error != nil {
                          print("Error in request!")
                      } else {
                          if let resp = response as? HTTPURLResponse, resp.statusCode == 200, let responseData = data {
                              
                              let posts = try? JSONDecoder().decode([Post].self, from: responseData)
                            
                            complitionHandler(posts ?? [])
                            
                          }
                      }
                      
                  }.resume()
              }
    }
    
    func postCreatePost(_ post: Post, complitionHandler: @escaping () -> Void) {
        
        let sendData = try? JSONEncoder().encode(post)
        
        guard let url = URL(string: baseURL + APIs.posts.rawValue),
            let data = sendData
            else { return }
                
                let request = MutableURLRequest(url: url)
                request.httpMethod = HTTPMethod.POST.rawValue
                request.httpBody = data
        request.setValue("\(data.count)", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                print("error")
            } else if let resp = response as? HTTPURLResponse, resp.statusCode == 201, let responseData = data {
                
                let responsePost = try? JSONDecoder.decode(Post.self, from: responseData) {
                    complitionHandler(responsePost)
                }
            }
        }.resume()
    }
    }

