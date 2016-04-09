//
//  HJRegisterViewController.swift
//  Xbook
//
//  Created by liuhj on 16/3/10.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJRegisterViewController: UIViewController {

    @IBOutlet weak var topLayout: NSLayoutConstraint!
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        XKeyBoard.registerKeyBoardHide(self)
        XKeyBoard.registerKeyBoardShow(self)
        
    }
    
    @IBAction func register(sender: AnyObject) {
        
        let user = AVUser()
        user.username = self.userName.text
        user.password = self.password.text
        user.email = self.email.text
        user.signUpInBackgroundWithBlock { (success, error) -> Void in
            if success {
                ProgressHUD.showSuccess("注册成功，请验证邮箱！")
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            } else {
                if error.code == 125 {
                    ProgressHUD.showError("邮箱不合法！")
                } else if error.code == 203 {
                    ProgressHUD.showError("邮箱已注册！")
                } else if error.code == 202 {
                    ProgressHUD.showError("用户名已存在！")
                } else {
                    ProgressHUD.showError("注册失败！")
                }
            }
        }
        
        
        
        
        
    }
    
    func keyboardWillHideNotification(notification : NSNotification) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topLayout.constant = 8
            self.view.layoutIfNeeded()
        }
    }
    func keyboardWillShowNotification(notification : NSNotification) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topLayout.constant = -150
            self.view.layoutIfNeeded()
        }
    }
    
    

}
