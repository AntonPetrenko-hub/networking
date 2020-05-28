//
//  ViewController.swift
//  Networking
//
//  Created by Антон Петренко on 30.11.2019.
//  Copyright © 2019 Антон Петренко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkManager = NetworkManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBAction func downloadPostsDidTap() {
        DispatchQueue.main.async {
            self.titleLabel.text = "Posts have been downloaded!"
        }
        networkManager.getAllPosts { (posts) in
        }
      
        
    }
    
}

