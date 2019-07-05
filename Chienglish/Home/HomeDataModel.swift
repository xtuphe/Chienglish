//
//  HomeDataModel.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/7/3.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import HandyJSON

class HomeDataTagsModel : NSObject, HandyJSON {
    var id = ""
    var name = ""
    required override init() {}
}

class HomeDataModel : NetworkListModel{
    @objc var data = Array<HomeArticleModel>()
    required init() {}
}

class HomeArticleModel: NSObject, HandyJSON {
    @objc var id = ""
    @objc var title = ""
    @objc var subtitle = ""
    @objc var type = 0
    @objc var content = ""
    @objc var img = ""
    @objc var audio = ""
    @objc var author = ""
    @objc var c_time = ""
    @objc var source = ""
    @objc var today_push = 0
    @objc var love = 0
    @objc var delove = 0
    @objc var created_at = ""
    @objc var updated_at = ""
    @objc var tags = Array<HomeDataTagsModel>()
    
    required override init() {}
}
