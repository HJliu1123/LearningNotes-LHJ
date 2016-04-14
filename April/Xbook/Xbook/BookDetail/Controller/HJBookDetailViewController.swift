//
//  HJBookDetailViewController.swift
//  Xbook
//
//  Created by liuhj on 16/4/12.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJBookDetailViewController: UIViewController, HJBookViewTabbarDelegate {
    
    var BookObject : AVObject?
    
    var BookTitleView : HJBookDetailView?
    
    var BookViewTabbar : HJBookViewTabbar?
    
    var BookTextView : UITextView?
    
    
    
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
    
    func comment() {
        print("0")
    }
    
    func commentController() {
        print("1")
    }
    
    func likeBook() {
        print("2")
    }
    
    func shareAction() {
        print("3")
    }
    
    
    
    
    

}
