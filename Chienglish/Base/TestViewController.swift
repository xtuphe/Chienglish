//
//  TestViewController.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/24.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    var term = ""
    let size = CGSize.init(width: 0.8 * screenWidth(), height: 0.6 * screenHeight())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: size.width, height: 44))
        navBar.text = term
        navBar.textColor = .white
        navBar.font = .boldSystemFont(ofSize: 20)
        navBar.textAlignment = .center
        navBar.backgroundColor = UIColor.init(white: 0, alpha: 1)
        view.addSubview(navBar)
        
        let toolBar = UIToolbar.init(frame: CGRect.init(x: 0, y: size.height - 144, width: size.width, height: 144))
        view.addSubview(toolBar)
        toolBar.backgroundColor = .white
        
        let leftButton = UIBarButtonItem.init(title: "词典设置", style: .plain, target: self, action: Selector("leftButtonPressed"))
        let rightButton = UIBarButtonItem.init(title: "添加到单词本", style: .plain, target: self, action: #selector(TestViewController.rightButtonPressed))
        toolBar.setItems([leftButton, rightButton], animated: false)
        // Do any additional setup after loading the view.
    }

    func leftButtonPressed() {
        print("11111111111111111111111111111111111111111")
    }
    
    @objc func rightButtonPressed() {
        print("11111111111111111111111111111111111111111")
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
