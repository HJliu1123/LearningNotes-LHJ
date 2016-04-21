//
//  HJCommentViewController.swift
//  Xbook
//
//  Created by liuhj on 16/4/15.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJCommentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, InputViewDelegate {
    
    var tableView : UITableView?
    
    var dataArray = NSMutableArray()
    
    var BookObject : AVObject?
    
    var input : InputView?
    
    var layView : UIView?
    
    var keyBoardHeight : CGFloat = 0.0
    
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
        
        self.tableView = UITableView(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HIGHT - 64 - 44))
        self.tableView?.registerClass(HJDiscussCell.classForCoder(), forCellReuseIdentifier: "Cell")
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.tableFooterView = UIView()
        self.view.addSubview(self.tableView!)
        
        self.tableView?.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(HJCommentViewController.headerRefresh))
        self.tableView?.mj_footer = MJRefreshBackFooter(refreshingTarget: self, refreshingAction: #selector(HJCommentViewController.footerRefresh))
        
        self.input = NSBundle.mainBundle().loadNibNamed("InputView", owner: self, options: nil).last as? InputView
        self.input?.frame = CGRectMake(0, SCREEN_HIGHT - 44, SCREEN_WIDTH, 44)
        self.input?.delegate = self
        self.view.addSubview(input!)
        
        self.layView = UIView(frame: self.view.frame)
        self.layView?.backgroundColor = UIColor.grayColor()
        self.layView?.alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapLayView"))
        self.layView?.addGestureRecognizer(tap)
        self.view.insertSubview(self.layView!, belowSubview: self.input!)
        
        
        
    }
    
    
    func sure() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView?.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? HJDiscussCell
        cell?.initFrame()
        let object = self.dataArray[indexPath.row] as? AVObject
        let user = object!["user"] as? AVUser
        cell?.nameLabel?.text = user?.username
        cell?.avatarImage?.image = UIImage(named: "Avatar")
        
        let date = object!["createdAt"] as? NSDate
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd hh:mm"
        cell?.dateLabel?.text = format.stringFromDate(date!)
        cell?.detailLabel?.text = object!["text"] as? String
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let object = self.dataArray[indexPath.row] as? AVObject
        let text = object!["text"] as? NSString
        let textSize = text?.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH - 56 - 8, 0), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFontOfSize(15)], context: nil).size
        
       return (textSize?.height)! + 30 + 25
        
    }
    
    
    
    func headerRefresh() {
        
        let query = AVQuery(className: "discuss")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.skip = 0
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.whereKey("BookObject", equalTo: self.BookObject)
        query.includeKey("user")
        query.includeKey("BookObject")
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            
            self.tableView?.mj_header.endRefreshing()
            self.dataArray.removeAllObjects()
            self.dataArray.addObjectsFromArray(results)
            self.tableView?.reloadData()
            
        }
        
    }
    
    
    func footerRefresh() {
        
        let query = AVQuery(className: "discuss")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.skip = self.dataArray.count
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.whereKey("BookObject", equalTo: self.BookObject)
        query.includeKey("user")
        query.includeKey("BookObject")
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            
            self.tableView?.mj_footer.endRefreshing()
            self.dataArray.addObjectsFromArray(results)
            self.tableView?.reloadData()
            
        }
        
        
    }
    
    /*
    * InputViewDelegate
    */
    func textViewHeightDidChange(height: CGFloat) {
        self.input?.height = height + 10
        self.input?.bottom = SCREEN_HIGHT - self.keyBoardHeight
    }
    
    func publishButtonDidClick(button: UIButton!) {
        
        ProgressHUD.show("")
        
        let object = AVObject(className: "discuss")
        object.setObject(self.input?.inputTextView?.text, forKey: "text")
        object.setObject(self.BookObject, forKey: "BookObject")
        object.setObject(AVUser.currentUser(), forKey: "user")
        object.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                self.input?.inputTextView?.resignFirstResponder()
                ProgressHUD.showSuccess("评论成功")
                
                self.BookObject?.incrementKey("discussNumber")
                self.BookObject?.saveInBackground()
                
            } else {
                
            }
        }
        
        
    }
    
    
    func keyboardWillHide(inputView: InputView!, keyboardHeight: CGFloat, animationDuration duration: NSTimeInterval, animationCurve: UIViewAnimationCurve) {
        
        UIView.animateWithDuration(duration, delay: 0, options: .BeginFromCurrentState, animations: { () -> Void in
            self.layView?.alpha = 0
            self.input?.bottom = SCREEN_HIGHT
            }) { (finish) -> Void in
                self.layView?.hidden = true
                self.input?.resetInputView()
                self.input?.inputTextView?.text = ""
                self.input?.bottom = SCREEN_HIGHT
        }
        
    }
    
    func keyboardWillShow(inputView: InputView!, keyboardHeight: CGFloat, animationDuration duration: NSTimeInterval, animationCurve: UIViewAnimationCurve) {
        
        self.keyBoardHeight = keyboardHeight
        self.layView?.hidden = false
        
        UIView.animateWithDuration(duration, delay: 0, options: .BeginFromCurrentState, animations: { () -> Void in
            self.layView?.alpha = 0
            self.input?.bottom = SCREEN_HIGHT - keyboardHeight
            }) { (finish) -> Void in
                
        }
        
        
    }
    
    
    
    
    
}
