//
//  shehuiDetailController.swift
//  news163Sample
//
//  Created by mac on 16/12/20.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class shehuiDetailController: UIViewController {

    @IBOutlet weak var web: UIWebView!
    var urlToLoad:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        if self.urlToLoad != nil{
            let url = NSURL(string: urlToLoad!)
            let req = NSURLRequest(URL: url!)
            self.web.loadRequest(req)
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
