//
//  NotiView.swift
//  BeaconScience
//
//  Created by Xtuphe on 2018/7/5.
//  Copyright © 2018年 Xtuphe's. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages

func showMessage(content: String, type:Theme) {
    let view = MessageView.viewFromNib(layout: .cardView)
    view.configureTheme(.info)
    view.configureDropShadow()
    view.configureContent(title: "", body: content)
    view.button?.isHidden = true
    view.iconImageView?.isHidden = true
    SwiftMessages.show(view: view)
}
