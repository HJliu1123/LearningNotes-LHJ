//
//  HJCommentViewController.swift
//  Xbook
//
//  Created by liuhj on 16/4/15.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJCommentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = self.view.viewWithTag(1234)
        button?.hidden = true
        
        let titleLabel = UILabel(frame: CGRectMake(0, 20, SCREEN_WIDTH, 44))
        titleLabel.text = "讨论区"
        titleLabel.font = UIFont(name: MY_FONT, size: 17)
        titleLabel.textAlignment = .Center
        titleLabel.textColor = MAIN_RED
        self.view.addSubview(titleLabel)
        
        
        
    }
    
    
    func sure() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    

}
