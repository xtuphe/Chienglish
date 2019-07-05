//
//  CommunityListCell.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/26.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit

class CommunityListCell: UITableViewCell {
    @IBOutlet weak var buttonsViewBase: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var contentTextView: WordTextView!
    let buttonsView = CommunityButtonsView.loadFromNib(nibName: "CommunityButtonsView")! as! CommunityButtonsView

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        buttonsViewBase.addSubview(buttonsView)
        buttonsView.mas_makeConstraints({ (make) in
            make?.top.leading()?.bottom()?.trailing()?.mas_equalTo()(buttonsViewBase)?.offset()(0)
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
