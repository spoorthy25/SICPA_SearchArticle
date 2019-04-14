//
//  NetworkRequest.swift
//  ArticleSearch
//
//  Created by Naga Ram Reddy Kancharla on 4/13/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import Foundation

class NetworkRequest{
    func makeRequestCall()-> NSMutableURLRequest{
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        
        //let urlString = NSString(format: "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=sports&api-key=D9WjRIkxrzMaGDOHCzyKXwLiQfgr7VPA")
        
        //let url = NSURL(string: urlString as String)
        let request : NSMutableURLRequest = NSMutableURLRequest()
        //request.url = NSURL(string: NSString(format: "%@", urlString) as String) as URL?
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
