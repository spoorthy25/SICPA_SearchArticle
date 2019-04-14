//
//  SearchArticleViewController.swift
//  ArticleSearch
//
//  Created by Naga Ram Reddy Kancharla on 4/13/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import Foundation
import UIKit

class SearchArticleViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var searchResult:[Dictionary<String,AnyObject>] = [Dictionary<String,AnyObject>()]
    var alertController: UIAlertController?
    
    
    override func viewDidLoad() {
        
        searchTextField.layer.borderColor = UIColor.white.cgColor
    }
    @IBAction func searchArticle(_ sender: Any) {
        //perform search to NYT
        
        performSearch(searchText: searchTextField.text ?? "New York Times")
    }
    
    
    func performSearch(searchText: String){
        Utils().showActivityIndicator(self,title: "Searching Article.."){alert,status in
            if(status == true){
                self.alertController = alert
            }
            }
        
            if(NetworkValidations.isConnectedToNetwork()){
                //make server call
                let request:NSMutableURLRequest = NetworkRequest().makeRequestCall()
                self.callSearchAPI(request: request)
            }else{
                let alert = UIAlertController(title: "Alert", message: "No Internet Connection!!!,Please check your network connections", preferredStyle: UIAlertController.Style.alert)
                self.present(alert, animated: true, completion: nil)
            }
        
        
    }
    
    func parseResult(json: Dictionary<String,AnyObject>){
        let result = json as Dictionary<String,AnyObject>
        let responseDict = result["response"]
        let articleDict = responseDict?["docs"]
        searchResult = articleDict as! [Dictionary<String, AnyObject>]
        DispatchQueue.main.async {
            self.alertController?.dismiss(animated: false, completion: {
            self.performSegue(withIdentifier: "ArticleResult", sender: nil)
            })
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ArticleSearchView
        {
            let vc = segue.destination as? ArticleSearchView
            vc?.searchArticleResult = searchResult
        }
    }
    
    func callSearchAPI(request: NSMutableURLRequest){
        let searchedString = searchTextField.text
        let urlString = NSString(format: "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(searchedString!)&api-key=D9WjRIkxrzMaGDOHCzyKXwLiQfgr7VPA" as NSString)
        request.url = NSURL(string: NSString(format: "%@", urlString) as String) as URL?
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error -> Void in
        
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
                if(json.count > 0){
                    self.parseResult(json: json)
                }
            } catch {
                print("error")
            }
        }
        task.resume()
    }
}
