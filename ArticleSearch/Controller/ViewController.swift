//
//  ViewController.swift
//  ArticleSearch
//
//  Created by Naga Ram Reddy Kancharla on 4/13/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let searchTitleList = ["SEARCH","POPULAR"]
    let searchCategoryList = [["SEARCH ARTICLE"],["MOST VIEWED","MOST SHARED","MOST EMAILED"]]
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.searchTitleList[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.searchTitleList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchTitleList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.searchCategoryList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "SearchTitleCell")
        cell.textLabel!.text = self.searchCategoryList[indexPath.section][indexPath.row]
        //tableView.separatorStyle = .none
        tableView.tableFooterView = UIView() 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0){
            self.performSegue(withIdentifier: "SearchArticle", sender: self)
        }
    }
    
    @objc func done() { // remove @objc for Swift 3
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

