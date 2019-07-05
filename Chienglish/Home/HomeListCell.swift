//
//  HomeListCell.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/7/5.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import Masonry

class HomeListCell: UITableViewCell {

    var homeImageView = UIView.loadFromNib(nibName: "HomeImageView") as! HomeImageView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(homeImageView)
        let padding = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        homeImageView.mas_makeConstraints { (maker) in
            maker?.edges.equalTo()(contentView)?.with()?.insets()(padding)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
