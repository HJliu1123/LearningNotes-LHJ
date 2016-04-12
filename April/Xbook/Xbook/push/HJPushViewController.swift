//
//  HJPushViewController.swift
//  Xbook
//
//  Created by liuhj on 16/1/20.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJPushViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArr = NSMutableArray()
    var navigationView : UIView!
    var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setNavigationBar()
        
        self.tableView = UITableView(frame: self.view.frame)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
        self.tableView?.registerClass(HJPushBookCell.classForCoder(), forCellReuseIdentifier: "Cell")
        self.tableView?.tableFooterView = UIView()
        
        self.tableView?.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector("headerRefresh"))
        
        self.tableView?.mj_footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("footerRefresh"))
        
        self.tableView?.mj_header.beginRefreshing()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationView.hidden = false
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationView.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //设置导航栏
    func setNavigationBar() {
        
        navigationView = UIView(frame: CGRectMake(0, -20, SCREEN_WIDTH,65))
        navigationView.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.addSubview(navigationView)
        //新建书评按钮
        let addBookButton = UIButton(frame: CGRectMake(20, 20, SCREEN_WIDTH, 45))
        addBookButton.setImage(UIImage(named: "plus circle"), forState: .Normal)
        addBookButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addBookButton.setTitle("  新建书评", forState: .Normal)
        addBookButton.titleLabel?.font = UIFont(name: MY_FONT, size: 15)
        addBookButton.contentHorizontalAlignment = .Left
        
        addBookButton.addTarget(self, action: Selector("pushNewBook"), forControlEvents: .TouchUpInside)
        
        navigationView.addSubview(addBookButton)
        
        
    }
    
    //点击新建书评弹出一个新的界面
    func pushNewBook() {
        let vc = HJPushNewBookController()
        HJGeneralFactory.addTitleWithTitle(vc, title1:"关闭", title2:"发布")
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = HJBookDetailViewController()
        vc.BookObject = self.dataArr[indexPath.row] as? AVObject
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //上拉加载、下拉刷新
    func headerRefresh() {
        let query = AVQuery(className: "Book")
        query.orderByDescending("creatAt")
        query.limit = 20
        query.skip = 0
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            self.tableView?.mj_header.endRefreshing()
            
            self.dataArr.removeAllObjects()
            self.dataArr.addObjectsFromArray(results)
            self.tableView?.reloadData()
        }
        
        
    }
    
    
    func footerRefresh() {
        let query = AVQuery(className: "Book")
        query.orderByDescending("creatAt")
        query.limit = 20
        query.skip = self.dataArr.count
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            self.tableView?.mj_footer.endRefreshing()
            
            self.dataArr.addObjectsFromArray(results)
            self.tableView?.reloadData()
        }

    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView?.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? HJPushBookCell
        let dict = self.dataArr[indexPath.row] as? AVObject
        
        cell?.bookName?.text = "《" + (dict!["BookName"]as! String) + "》:" + (dict!["title"]as! String)
        cell?.editor?.text = "作者" + (dict!["BookEditor"]as! String)
        
        let date = dict!["createdAt"] as? NSDate
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd hh:mm"
        cell?.more?.text = format.stringFromDate(date!)
        
        let coverFile = dict!["cover"] as? AVFile
        
        cell?.cover?.sd_setImageWithURL(NSURL(string: (coverFile?.url)!), placeholderImage: UIImage(named: "Cover"))
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }

}
