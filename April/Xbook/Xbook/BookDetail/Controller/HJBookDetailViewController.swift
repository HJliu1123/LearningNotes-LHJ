//
//  HJBookDetailViewController.swift
//  Xbook
//
//  Created by liuhj on 16/4/12.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJBookDetailViewController: UIViewController {
    
    var BookObject : AVObject?
    
    var BookTitleView : HJBookTitleView?
    
    var BookViewTabbar : HJBookViewTabbar?
    
    var BookTextView : UITextView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        
        
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
