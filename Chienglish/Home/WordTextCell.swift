//
//  WordTextCell.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/21.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit

class WordTextCell: UITableViewCell {

    @IBOutlet weak var textView: WordTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
