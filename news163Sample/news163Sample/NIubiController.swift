//
//  NIubiController.swift
//  news163Sample
//
//  Created by mac on 16/12/19.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class NIubiController: UIViewController {
    

    override func viewDidLoad() {
        //self.view.bringSubviewToFront(<#T##view: UIView##UIView#>)
        super.viewDidLoad()
        launchAnimation()
    }
    
    private func launchAnimation(){
        let nc = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateViewControllerWithIdentifier("launch")
        let launchview = nc.view!
        let delegate = UIApplication.sharedApplication().delegate
        delegate?.window!!.addSubview(launchview)
        
        
    UIView.animateWithDuration(1, delay: 1.5, options: .BeginFromCurrentState, animations: {
        launchview.alpha = 0.0
        let transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.0)
        launchview.layer.transform = transform
        }) { (finished) in
            launchview.removeFromSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
