//
//  CommentCell.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/26.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var textView: WordTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
