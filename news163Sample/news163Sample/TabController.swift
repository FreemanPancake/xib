//
//  TabController.swift
//  news163Sample
//
//  Created by mac on 16/11/30.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let story = UIStoryboard(name: "Main", bundle: nil)
//        
//        let c1 = story.instantiateViewControllerWithIdentifier("xqb") as! MainController
//           c1.tabBarItem.title = "NBA"
////         c1.tabBarItem.badgeValue = "9999"
//        c1.tabBarItem.image = UIImage(named: "新闻.png")
//        self.tabBar.tintColor = UIColor.redColor()
//        
//        let c2 = story.instantiateViewControllerWithIdentifier("zhibo") as! secondViewController
//       
//        c2.view.backgroundColor = UIColor.whiteColor()
//        c2.tabBarItem.title = "社会"
//        c2.tabBarItem.image = UIImage(named: "社会.png")
//        
//        let c3 = story.instantiateViewControllerWithIdentifier("yule") as! thirdViewController
// 
//        c3.view.backgroundColor = UIColor.whiteColor()
//        c3.tabBarItem.title = "娱乐"
//        c3.tabBarItem.image = UIImage(named: "话题.png")
//        
//        let c4 = story.instantiateViewControllerWithIdentifier("wode") as! fourthViewController
//           c4.view.backgroundColor = UIColor.whiteColor()
//        c4.tabBarItem.title = "我"
//        c4.tabBarItem.image = UIImage(named: "我的.png")
//        self.viewControllers = [c1,c2,c3,c4]
//        self.selectedIndex = 0
//        
//
//        
//        self.title = "网易"
      
       
        automaticallyAdjustsScrollViewInsets = false
        var style = SegmentStyle()
        
        style.showCover = true
        style.gradualChangeTitleColor = true
        style.coverBackgroundColor = UIColor.lightGrayColor()
        
        let titles = setChildVcs().map{$0.title! }
        let scroll = ScrollPageView(frame: CGRect(x: 0, y: 64, width: view.bounds.size.width, height: view.bounds.size.height - 64), segmentStyle: style, titles: titles, childVcs: setChildVcs(), parentViewController: self)
        view.addSubview(scroll)
        
        
        
        
    }
    func setChildVcs() -> [UIViewController] {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = story.instantiateViewControllerWithIdentifier("xqb")
        vc1.title = "NBA"
        
        
        let vc2 = story.instantiateViewControllerWithIdentifier("zhibo")
        
        vc2.title = "社会"
        
        let vc3 = story.instantiateViewControllerWithIdentifier("yule")
        
        vc3.title = "娱乐"
        
        let vc4 = story.instantiateViewControllerWithIdentifier("wode")
        
        vc4.title = "我"
        
        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor.whiteColor()
        vc5.title = "军事"
        
        let vc6 = UIViewController()
        vc6.view.backgroundColor = UIColor.whiteColor()
        vc6.title = "财经"
        
        let vc7 = story.instantiateViewControllerWithIdentifier("keji")
        
        vc7.title = "科技"
        
        let vc8 = UIViewController()
        vc8.view.backgroundColor = UIColor.whiteColor()
        vc8.title = "旅游"
        
        let vc9 = UIViewController()
        vc9.view.backgroundColor = UIColor.whiteColor()
        vc9.title = "读书"
        
        let vc10 = UIViewController()
        vc10.view.backgroundColor = UIColor.whiteColor()
        vc10.title = "手机"
        
        let vc11 = UIViewController()
        vc11.view.backgroundColor = UIColor.whiteColor()
        vc11.title = "健康"
        
        self.title = "网易"
        return [vc1, vc2, vc3, vc7,vc4, vc5, vc6, vc8, vc9, vc10, vc11]
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.title = title
    }

}
