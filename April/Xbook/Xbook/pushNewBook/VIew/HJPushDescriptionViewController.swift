//
//  HJPushDescriptionViewController.swift
//  Xbook
//
//  Created by liuhj on 16/3/7.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

typealias HJPushDescriptionViewControllerBlock = (description : String) ->Void

class HJPushDescriptionViewController: UIViewController {
    
    var textView : JVFloatLabeledTextView?
    var callBack : HJPushDescriptionViewControllerBlock?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.textView = JVFloatLabeledTextView(frame: CGRectMake(8, 58, SCREEN_WIDTH - 16, SCREEN_HIGHT - 58 - 8))
        self.view.addSubview(self.textView!)
        self.textView?.placeholder = "     你可以在这里撰写详细的评价、吐槽、介绍~~~"
        self.textView?.font = UIFont(name: MY_FONT, size: 17)
        self.view.tintColor = UIColor.grayColor()
        
        XKeyBoard.registerKeyBoardHide(self)
        XKeyBoard.registerKeyBoardShow(self)
        
    }
    

    func sure() {
        self.callBack!(description: (self.textView?.text)!)
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    func keyboardWillHideNotification(notification : NSNotification) {
        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func keyboardWillShowNotification(notification : NSNotification) {
        let rect = XKeyBoard.returnKeyBoardWindow(notification)
        self.textView?.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
    }
    
    
    
}
