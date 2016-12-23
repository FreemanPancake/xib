//
//  thirdViewController.swift
//  news163Sample
//
//  Created by mac on 16/11/30.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class thirdViewController: UITableViewController {
    
    //API
    let newsUrlStr = "http://c.m.163.com/dlist/article/dynamic?from=T1348648517839&fn=16&passport=&devId=y7JZrsXv1DRqj3G6fdHtaNl4UG2aYhxrzjmibHb%2BNSM%2BenZXqmJejpGinGmLeP2h&offset=0&size=10&version=18.1&spever=false&net=wifi&lat=&lon=&ts=1482157723&sign=sp5Mcni8DOnIIHRQGyHLjem84ShyEoLWjIbOShIyY5p48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"
    
    var news = [] //空数组。数据源。
    
 
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
              loadDataSource()
    }

    
    
    func loadDataSource(){
        let url = NSURL(string: newsUrlStr)
        
        let jsonData = NSData(contentsOfURL: url!)
        
        let session = NSURLSession.sharedSession()//单例
        //创建任务
        let task = session.dataTaskWithURL(url!) { (jsonData, response, error) in
            if jsonData != nil{
                //                if !NSJSONSerialization.isValidJSONObject(data!){
                //
                //                    //let str = NSString(data: data!, encoding: UInt)
                //                    //非JSON格式，字符串正则化
                //
                //                }
                //反序列化为JSON对象，前题""
                let json = try! NSJSONSerialization.JSONObjectWithData(jsonData!, options: .MutableContainers) as? NSDictionary
                if json != nil{
                    //解析
                    
                    let newsDataSource = json!["T1348648517839"] as! NSArray
                    
                    let currentDataSource = NSMutableArray()
                    for currentNews in newsDataSource{
                        //封装
                        let newsItem = NewsItem()
                        newsItem.ltitle2 = currentNews["ltitle"] as? String
                        newsItem.imgsrc2 = currentNews["imgsrc"] as? String
                        newsItem.url_3w2 = currentNews["url_3w"] as? String
                        
                        currentDataSource.addObject(newsItem)
                    }
                    //回调或者是通知主线程刷新，异步队列
                    dispatch_async(dispatch_get_main_queue(), {
                        self.news = currentDataSource
                        self.tableView.reloadData()
                    })
                }
            }
        }
        //执行任务
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.news.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :yuleCell = tableView.dequeueReusableCellWithIdentifier("reusee", forIndexPath: indexPath) as! yuleCell
        
        // Configure the cell...
        
        let model = news[indexPath.row] as! NewsItem
        cell.title2.text = model.ltitle2
        let imageUrl:NSURL  = NSURL(string: model.imgsrc2!)!
        let imageData:NSData  = try! NSData(contentsOfURL: imageUrl)!
        let image = UIImage(data: imageData)
        cell.image1.image = image

        
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detail = segue.destinationViewController as! yuleDetailController
        let index = self.tableView.indexPathForSelectedRow
        let model = news[index!.row] as! NewsItem
        detail.urlToLoad = model.url_3w2
    }

  

}
