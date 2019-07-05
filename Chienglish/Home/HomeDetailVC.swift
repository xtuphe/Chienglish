//
//  HomeDetailVC.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/7/5.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import Masonry

class HomeDetailVC: UIViewController {

    let header = UIView.loadFromNib(nibName: "HomeImageView") as! HomeImageView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.removeConstraints([header.baseHeight, header.baseWidth])
        view.addSubview(header)
        header.mas_makeConstraints { (make) in
            make?.width.mas_equalTo()(screenWidth())
            make?.height.mas_equalTo()(screenHeight())
        }
        
        
        
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
