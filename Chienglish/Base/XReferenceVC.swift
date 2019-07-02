//
//  XReferenceVC.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/24.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import KUIPopOver

class XReferenceVC: UIReferenceLibraryViewController, KUIPopOverUsable {
    var contentSize = CGSize.init(width: 0.8 * screenWidth(), height: 0.6 * screenHeight())
    var term = ""

    // MARK: - UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //去掉右上角Done按钮
        navigationItem.rightBarButtonItem = nil
        
        let left = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: contentSize.width / 2.0, height: 44))
        left.backgroundColor = .black
        left.setTitleColor(.white, for: .normal)
        left.setTitle("词典设置", for: .normal)
        left.isUserInteractionEnabled = false
        
        let right = UIButton.init(frame: CGRect.init(x: contentSize.width / 2.0, y: 0, width: contentSize.width / 2.0, height: 44))
        right.backgroundColor = .black
        right.setTitle("添加到单词本", for: .normal)
        right.addTarget(self, action: #selector(XReferenceVC.rightButtonPressed(button:)), for: .touchUpInside)

        let containerView = view.subviews.first!
        for sView in containerView.subviews {
            if sView .isKind(of: UIToolbar.self) {
                sView.addSubview(left)
                sView.addSubview(right)
            }
        }
    }
    
    @objc func rightButtonPressed(button : UIButton) {
        button.setTitle("已添加", for: .normal)
    }
    
}
