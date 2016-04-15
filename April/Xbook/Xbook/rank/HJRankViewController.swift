//
//  HJRankViewController.swift
//  Xbook
//
//  Created by liuhj on 16/1/20.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJRankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
//        AVUser.logOut()
        
        
        if AVUser.currentUser() == nil {
            let story = UIStoryboard(name: "login", bundle: nil)
            let loginVc = story.instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(loginVc, animated: true, completion: { () -> Void in
                
            })
        }
        
        
        
        
        
//        let label =  UILabel(frame: CGRectMake(100, 100, 200, 30))
//        
//        label.text = "你深V sal 撒进房间"
//        label.font = UIFont(name: MY_FONT, size: 14)
//        label.textColor = UIColor.blackColor()
//        label.textAlignment = NSTextAlignment.Center
//        label.adjustsFontSizeToFitWidth = true
//        
//        
//        self.view.addSubview(label)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
