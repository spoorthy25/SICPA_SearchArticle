//
//  Utils.swift
//  ArticleSearch
//
//  Created by Naga Ram Reddy Kancharla on 4/14/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    
    func showActivityIndicator(_ viewController: UIViewController, title: String, callback: @escaping( UIAlertController,Bool)->()){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        //create and activity indicator
        let indicator = UIActivityIndicatorView(frame: alert.view.bounds)
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        indicator.color = UIColor.gray
        
        //add the activity indicator as a subview of the alert controller's view
        alert.view.addSubview(indicator)
        indicator.isUserInteractionEnabled = false
        indicator.startAnimating()
        viewController.present(alert, animated: true, completion: {() -> Void in callback(alert,true)
            
        })
    }
}
