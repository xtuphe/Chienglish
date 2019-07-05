//
//  CommunityListVC.swift
//  Chienglish
//
//  Created by 谢嘉康 on 2019/6/26.
//  Copyright © 2019 谢嘉康. All rights reserved.
//

import UIKit

class CommunityListVC: UITableViewController {

    var data = Array<CommunityDetailModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "CommunityListCell", bundle: nil), forCellReuseIdentifier: "CommunityListCell")
        tableView.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.borderColor = .lightGray
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor : UIColor.white]
        requestData(page: 1)
    }
    
    func requestData(page : Int) {
        XNetwork .request(url: "api/userSource", param: nil) { (success, dic) in
            if success {
                if let model = CommunityDataModel.deserialize(from: dic) {
                    if model.data.count > 0 {
                        self.data.append(contentsOf: model.data)
                    }
                }
            }
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommunityListCell", for: indexPath) as! CommunityListCell
        let model = self.data[indexPath.row]
        cell.contentTextView.text = model.content
        cell.buttonsView.button0.setTitle(String(model.love), for: .normal)
        cell.buttonsView.button1.setTitle(String(model.delove), for: .normal)
        cell.buttonsView.button2.setTitle(String(model.store_num), for: .normal)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
