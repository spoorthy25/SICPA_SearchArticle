//
//  ArticleSearchView.swift
//  ArticleSearch
//
//  Created by Naga Ram Reddy Kancharla on 4/14/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import Foundation
import UIKit

class ArticleSearchView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var searchArticleResult:[Dictionary<String,AnyObject>] = [Dictionary<String,AnyObject>]()
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArticleResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ArticleSearchCell") as! SearchResultCell
        var cell:SearchResultCell = tableView.dequeueReusableCell(withIdentifier: "ArticleSearchCell", for: indexPath) as! SearchResultCell

        if(indexPath.row < searchArticleResult.count){
            let resultDict = searchArticleResult[indexPath.row]
        
            let headlineDict = resultDict["headline"] as! Dictionary<String,AnyObject>
            let headlineString = headlineDict["print_headline"]
            cell.titleLabel?.text = headlineString as? String
            cell.datePublished?.text = resultDict["pub_date"] as? String
            return cell
        }else{
            return cell
        }
    }
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchResultCell.self, forCellReuseIdentifier: "ArticleSearchCell")
        
        view.addSubview(tableView)
    
    }
    

}
