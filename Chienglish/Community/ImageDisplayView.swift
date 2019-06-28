//
//  ImageDisplayView.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/26.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit
import SKPhotoBrowser
import Masonry

class ImageDisplayView: UIView {

    var urls = [String]()

    
    override func awakeFromNib() {
        print("image display awake")
        loadWithImageUrls(url: ["test1", "test2", "test3", "test1"])
    }
    
    func loadWithImageUrls(url : Array<String>) {
        urls = url
        let view = UIView.loadFromNib(nibName: "ImageDisplayView4")!
        addSubview(view)
        view.mas_makeConstraints { (make) in
            make!.top.bottom()?.leading()?.trailing()?.mas_equalTo()(0)
        }
    }
    
    func setupImageViews() {

    }
    
}


class ImageDisplayView4: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view! as! UIImageView
        var images = [SKPhoto]()
        let photo = SKPhoto.photoWithImage(UIImage.init(named: "test1")!)
        images.append(photo)
        let browser = SKPhotoBrowser(originImage: imageView.image ?? UIImage(), photos: images, animatedFromView: imageView)
        browser.initializePageIndex(0)
        SKPhotoBrowserOptions.displayAction = false
        SKPhotoBrowserOptions.displayStatusbar = true
        Router.rootVC().present(browser, animated: true, completion: {})
    }
}
