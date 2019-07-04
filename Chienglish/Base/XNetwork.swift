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

func url(url : String) -> String {
    let base = "http://zcwserver.free.idcfengye.com/"
    let result = base + url
    return result
}

class NetworkBaseModel : HandyJSON {
    var code = 0
    var data = Dictionary<String, Any>()
    
    required init() {}
}


class XNetwork: NSObject {

    @objc class func path(path : String) -> String {
        return url(url: path)
    }
    
    @objc class func homePageList(param : NSString) {
        let request = Alamofire.request(url(url: "api/home?\(param)"), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        
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
