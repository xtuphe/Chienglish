//
//  XNetwork.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/7/2.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

func urls(url : String) -> String {
//    let base = "http://zcwserver.free.idcfengye.com/"
    let base = "http://106.12.59.22/"
    let result = base + url
    return result
}

class NetworkBaseModel : HandyJSON {
    var code = 0
    var data = Dictionary<String, Any>()
    
    required init() {}
}

class NetworkListModel : NSObject, HandyJSON {
    @objc var current_page = 1
    @objc var first_page_url = ""
    @objc var from = 1
    @objc var last_page = 1
    @objc var last_page_url = ""
    @objc var next_page_url = ""
    @objc var path = ""
    @objc var per_page = 10
    @objc var prev_page_url = ""
    @objc var to = 1
    @objc var total = 1
    
    required override init() {}
}

class UserModel : NSObject, HandyJSON {
    @objc var id = ""
    @objc var head_img = ""
    @objc var name = ""
    
    required override init() {}
}

class XNetwork: NSObject {

    @objc class func path(path : String) -> String {
        return urls(url: path)
    }
    
    @objc class func homePageList(param : NSString) {
        let request = Alamofire.request(urls(url: "api/home?\(param)"), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        
        request.responseJSON { (json) in
            let dic = json.result.value as? NSDictionary
            let result = NetworkBaseModel.deserialize(from: dic)
            
            if json.result.isFailure {
                showMessage(content: "\(json.result.error?.localizedDescription ?? "") \(String(describing: result?.code))", type: .error)
            }
            let data = HomeDataModel.deserialize(from: result?.data)
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "homePageListData"), object: data)
        }
    }
    
    class func request(url : String, param : Dictionary<String, Any>?, callBack : @escaping (Bool, [String : Any]) -> Void) {
        let request = Alamofire.request(urls(url: url), method: .get, parameters: param, encoding: URLEncoding.default, headers: nil)
        request.responseJSON { (json) in
            let dic = json.result.value as? NSDictionary
            let result = NetworkBaseModel.deserialize(from: dic)
            
            if json.result.isFailure {
                showMessage(content: "\(json.result.error?.localizedDescription ?? "") \(String(describing: result?.code))", type: .error)
            }
            callBack(json.result.isSuccess, result?.data ?? ["empty" : "empty"])
        }
    }
    
    class func JSONStringFromDictionary(dictionary : NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        let JStr = String(data: data!, encoding: String.Encoding.utf8)
        return JStr!
    }
    
    class func homeList(param : NSString, block : (_ data : DataResponse<Any>) -> Void) {
        
    }
}
