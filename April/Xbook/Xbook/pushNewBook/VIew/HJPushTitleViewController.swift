//
//  HJPushTitleViewController.swift
//  Xbook
//
//  Created by liuhj on 16/3/7.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

typealias HJPushTitleCallBack = (Title:String)->Void

class HJPushTitleViewController: UIViewController {

    var textField : UITextField?
    
    var callBack : HJPushTitleCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.textField = UITextField(frame: CGRectMake(15, 60, SCREEN_WIDTH - 30, 30))
        self.textField?.borderStyle = .RoundedRect
        self.textField?.placeholder = "书评标题"
        self.textField?.font = UIFont(name: MY_FONT, size: 15)
        self.view.addSubview(self.textField!)
        
        self.textField?.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sure() {
        self.callBack?(Title: self.textField!.text!)
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    
    
    

}
