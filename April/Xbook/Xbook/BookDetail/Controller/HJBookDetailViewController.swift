//
//  HJBookDetailViewController.swift
//  Xbook
//
//  Created by liuhj on 16/4/12.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJBookDetailViewController: UIViewController, HJBookViewTabbarDelegate, InputViewDelegate {
    
    var BookObject : AVObject?
    
    var BookTitleView : HJBookDetailView?
    
    var BookViewTabbar : HJBookViewTabbar?
    
    var BookTextView : UITextView?
    
    var input : InputView?
    
    var layView : UIView?
    
    var keyBoardHeight : CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.tintColor = UIColor.grayColor()
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics: .Default)
        
        self.initBookDetailView()
        
        self.BookViewTabbar = HJBookViewTabbar(frame: CGRectMake(0, SCREEN_HIGHT - 40, SCREEN_WIDTH, 40))
        self.view.addSubview(self.BookViewTabbar!)
        self.BookViewTabbar?.delegate = self
        
        self.BookTextView = UITextView(frame: CGRectMake(0, 64 + SCREEN_HIGHT, SCREEN_WIDTH, SCREEN_HIGHT - 64 - SCREEN_HIGHT/4 - 40))
        self.BookTextView?.editable = false
        self.BookTextView?.text = self.BookObject!["description"] as? String
        self.view.addSubview(self.BookTextView!)
        
        self.isLove()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func initBookDetailView() {
        
        self.BookTitleView = HJBookDetailView(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HIGHT/4))
        self.view.addSubview(self.BookTitleView!)
        
        let coverFile = self.BookObject!["cover"] as? AVFile
        self.BookTitleView?.cover?.sd_setImageWithURL(NSURL(string: (coverFile?.url)!), placeholderImage: UIImage(named: "Cover"))
        
        self.BookTitleView?.Bookname?.text = "《" + (self.BookObject!["BookName"] as! String) + "》"
        self.BookTitleView?.Editor?.text = "作者：" + (self.BookObject!["BookEditor"] as! String)
        
        let user = self.BookObject!["user"] as? AVUser
        user?.fetchInBackgroundWithBlock({ (returnUser, error) -> Void in
            self.BookTitleView?.userName?.text = "编者：" + (returnUser as! AVUser).username
        })
        
        
        let date = self.BookObject!["createdAt"] as? NSDate
        let format = NSDateFormatter()
        format.dateFormat = "yy-MM-dd"
        self.BookTitleView?.date?.text = format.stringFromDate(date!)
        
        let scoreString = self.BookObject!["score"] as? String
        self.BookTitleView?.score?.show_star = Int(scoreString!)!
        
        self.BookTitleView?.more?.text = "55个喜欢.5次评论.12452次浏览"
        
    }
    
    func isLove() {
        
        let query = AVQuery(className: "Love")
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.whereKey("BookObject", equalTo: self.BookObject)
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            if results != nil && results.count != 0 {
                let button = self.BookViewTabbar?.viewWithTag(2) as? UIButton
                button?.setImage(UIImage(named: "solidheard"), forState: .Normal)
            }
        }
        
    }
    
    func publishButtonDidClick(button: UIButton!) {
        
        ProgressHUD.show("")
        
        let object = AVObject(className: "discuss")
        object.setObject(self.input?.inputTextView?.text, forKey: "text")
        object.setObject(AVUser.currentUser(), forKey: "user")
        object.setObject(self.BookObject, forKey: "BookObject")
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                self.input?.inputTextView?.resignFirstResponder()
                ProgressHUD.showSuccess("评论成功")
            } else {
            
            }
        }
       
    }
    
    
    
    func textViewHeightDidChange(height: CGFloat) {
        self.input?.height = height + 10
        self.input?.bottom = SCREEN_HIGHT - self.keyBoardHeight
    }
    
    
    func keyboardWillShow(inputView: InputView!, keyboardHeight: CGFloat, animationDuration duration: NSTimeInterval, animationCurve: UIViewAnimationCurve) {
        self.keyBoardHeight = keyboardHeight
        UIView.animateWithDuration(duration, delay: 0, options: .BeginFromCurrentState, animations: { () -> Void in
            self.input?.bottom = SCREEN_HIGHT - keyboardHeight
            self.layView?.alpha = 0
            }) { (finish) -> Void in
                
        }
        
    }
    
    func keyboardWillHide(inputView: InputView!, keyboardHeight: CGFloat, animationDuration duration: NSTimeInterval, animationCurve: UIViewAnimationCurve) {
        
        UIView.animateWithDuration(duration, delay: 0, options: .BeginFromCurrentState, animations: { () -> Void in
            self.input?.bottom = SCREEN_HIGHT + (self.input?.height)!
            self.layView?.alpha = 0.2
            }) { (finish) -> Void in
                self.layView?.hidden = true
        }
    }
    
    
    func comment() {
        
        if self.input == nil {
            self.input = NSBundle.mainBundle().loadNibNamed("InputView", owner: self, options: nil).last as? InputView
            self.input?.frame = CGRectMake(0, SCREEN_HIGHT - 44, SCREEN_WIDTH, 44)
            self.input?.delegate = self
            self.view.addSubview(self.input!)
        }
        if self.layView == nil {
            self.layView = UIView(frame: self.view.frame)
            self.layView?.backgroundColor = UIColor.grayColor()
            self.layView?.alpha = 0;
            let tap = UITapGestureRecognizer(target: self, action: Selector("tapInputView"))
            self.layView?.addGestureRecognizer(tap)
        }
        self.view.insertSubview(self.layView!, belowSubview: self.input!)
        self.layView?.hidden = false
        self.input?.inputTextView?.becomeFirstResponder()
        
    }
    
    func tapInputView() {
        
        self.input?.inputTextView?.resignFirstResponder()
        
    }

    
    func commentController() {
        
        let vc = HJCommentViewController()
        HJGeneralFactory.addTitleWithTitle(vc, title1: "", title2: "关闭")
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
        
    }
    
    func likeBook(button : UIButton) {
        button.enabled = false
        button.setImage(UIImage(named: "redheart"), forState: .Normal)
        
        let query = AVQuery(className: "Love")
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.whereKey("BookObject", equalTo: self.BookObject)
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            
            if results != nil && results.count != 0 {
                for var object in results {
                    object = (object as? AVObject)!
                    object.deleteEventually()
                }
                button.setImage(UIImage(named: "heart"), forState: .Normal)
            } else {
                let object = AVObject(className: "Love")
                object.setObject(AVUser.currentUser(), forKey: "user")
                object.setObject(self.BookObject, forKey: "BookObject")
                object.saveInBackgroundWithBlock({ (success, error) -> Void in
                    if success {
                        button.setImage(UIImage(named: "solidheart"), forState: .Normal)
                    } else {
                        ProgressHUD.showError("操作失败")
                    }
                })
            }
            button.enabled = true
            
        }
    }
    
    func shareAction() {
        print("3")
    }
    
    
    
    

}
