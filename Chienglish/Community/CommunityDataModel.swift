//
//  CommunityDataModel.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/7/4.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import HandyJSON

class CommunityDetailModel : NSObject, HandyJSON {
    var id = ""
    var title = ""
    var subtitle = ""
    var content = ""
    var img = ""
    var audio = ""
    var type = 0
    var is_push = 1
    var love = 0
    var delove = 0
    var store_num = 999
    var user_id = 0
    var create_at = ""
    var update_at = ""
    var tags = Array<HomeDataTagsModel>()
    var user = UserModel()
    
    required override init() {}
}

class CommunityDataModel: NetworkListModel {
    var data = Array<CommunityDetailModel>()
    required init() {}
}

