//
//  DetailController.swift
//  news163Sample
//
//  Created by chuna on 2016/11/24.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var urlToLoad:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.urlToLoad != nil{
            let url = NSURL(string: urlToLoad!)
            let req = NSURLRequest(URL: url!)
            self.webView.loadRequest(req)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
