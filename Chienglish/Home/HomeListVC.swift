//
//  HomeListVC.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/7/5.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit

class HomeListVC: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.register(HomeListCell.self, forCellReuseIdentifier: "HomeListCell")
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.delegate = self
        
        UIView.animate(withDuration: 0.2) {
            UIApplication.shared.setStatusBarHidden(true, with: .slide)
        }
        
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeListCell") as! HomeListCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenWidth() * 1.3
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = HomeDetailVC.init()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension HomeListVC : UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let cell = tableView.cellForRow(at: tableView.indexPathForSelectedRow!) as! HomeListCell
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! HomeDetailVC
        
        let fromView = cell.homeImageView
        let toView = toVC.header
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        containerView.addSubview(fromView)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveLinear, animations: {
            containerView.layoutIfNeeded()
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        
    }
    
    
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    
}
