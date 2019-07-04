//
//  HomeCell.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/7/3.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeCell: UITableViewCell {

    @objc var bgImageView : UIImageView
    @objc var bgView : UIView
    @objc var titleLabel : UILabel
    @objc var contentLabel : UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        bgImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth() - 40, height: (screenWidth() - 40) * 1.3))
        bgImageView.layer.cornerRadius = 15
        bgImageView.layer.masksToBounds = true
        bgImageView.contentMode = .scaleAspectFill
        
        bgView = UIView.init(frame: CGRect.init(x: 20, y: 0, width: screenWidth() - 40, height: (screenWidth() - 40) * 1.3 + 25))
        bgView.backgroundColor = .clear
        
        titleLabel = UILabel.init(frame: CGRect.init(x: 15, y: 20, width: screenWidth() - 30, height: 100))
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.lineBreakMode = .byClipping
        
        contentLabel = UILabel.init(frame: CGRect.init(x: 15, y: (screenWidth() - 40) * 1.3 - 120, width: screenWidth() - 60, height: 100))
        contentLabel.font = UIFont.systemFont(ofSize: 15)
        contentLabel.textColor = .white
        contentLabel.alpha = 0.5
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byTruncatingHead
        contentLabel.layer.shadowColor = UIColor.black.cgColor
        contentLabel.layer.shadowOffset = CGSize.init(width: 3, height: 3)
        contentLabel.layer.shadowRadius = 5
        contentLabel.layer.shadowOpacity = 0.8
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(bgView)
        bgView.addSubview(bgImageView)
        bgView.addSubview(titleLabel)
        bgView.addSubview(contentLabel)
    }
    
    @objc func reload(model : HomeArticleModel) {
        titleLabel.text = "\(model.title)\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        contentLabel.text = "\(model.content)"
        let url = model.img
        bgImageView.af_setImage(withURL: URL(string: url)!)
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
