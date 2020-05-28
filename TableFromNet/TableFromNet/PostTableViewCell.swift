//
//  PostTableViewCell.swift
//  TableFromNet
//
//  Created by Антон Петренко on 02.12.2019.
//  Copyright © 2019 Антон Петренко. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    
    @IBOutlet weak var postBodyLabel: UILabel!
    
    func configure(_ post: Post) {
        postTitleLabel.text = post.title
        postBodyLabel.text = post.body
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
