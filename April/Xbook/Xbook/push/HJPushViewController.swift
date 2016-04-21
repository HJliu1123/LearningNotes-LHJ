//
//  HJPushViewController.swift
//  Xbook
//
//  Created by liuhj on 16/1/20.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJPushViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SWTableViewCellDelegate {
    
    var dataArr = NSMutableArray()
    var navigationView : UIView!
    var tableView : UITableView?
    
    var swipIndexPath : NSIndexPath?
    
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
        
        self.tableView?.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(HJPushViewController.headerRefresh))
        
        self.tableView?.mj_footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: #selector(HJPushViewController.footerRefresh))
        
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
        
        addBookButton.addTarget(self, action: #selector(HJPushViewController.pushNewBook), forControlEvents: .TouchUpInside)
        
        navigationView.addSubview(addBookButton)
        
        
    }
    
    //点击新建书评弹出一个新的界面
    func pushNewBook() {
        let vc = HJPushNewBookController()
        HJGeneralFactory.addTitleWithTitle(vc, title1:"关闭", title2:"发布")
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
        
    }
    
    func returnRightBtn() ->[AnyObject] {
        
        let btn1 = UIButton(frame: CGRectMake(0, 0, 88, 88))
        btn1.backgroundColor = UIColor.orangeColor()
        btn1.setTitle("编辑", forState: .Normal)
        
        let btn2 = UIButton(frame: CGRectMake(0, 0, 88, 88))
        btn2.backgroundColor = UIColor.redColor()
        btn2.setTitle("删除", forState: .Normal)
        
        return [btn1, btn2]
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = HJBookDetailViewController()
        vc.BookObject = self.dataArr[indexPath.row] as? AVObject
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func swipeableTableViewCell(cell: SWTableViewCell!, scrollingToState state: SWCellState) {
        
        let indexPath = self.tableView?.indexPathForCell(cell)
        if state == .CellStateRight {
            if self.swipIndexPath != nil && self.swipIndexPath?.row != indexPath?.row {
                let swipedCell = self.tableView?.cellForRowAtIndexPath(self.swipIndexPath!) as? HJPushBookCell
                swipedCell?.hideUtilityButtonsAnimated(true)
            }
            self.swipIndexPath = indexPath
        } else if state == .CellStateCenter {
            self.swipIndexPath = nil

        }
        
    }
    
    func swipeableTableViewCell(cell: SWTableViewCell!, didTriggerRightUtilityButtonWithIndex index: Int) {
        cell.hideUtilityButtonsAnimated(true)
        
        let indexPath = self.tableView?.indexPathForCell(cell)
        let object = self.dataArr[indexPath!.row] as? AVObject
        
        if index == 0 {//编辑
            
            let vc = HJPushNewBookController()
            HJGeneralFactory.addTitleWithTitle(vc, title1: "关闭", title2: "发布")
            
            vc.fixType = "fix"
            vc.BookObject = object
            vc.fixBook()
            self.presentViewController(vc, animated: true, completion: { () -> Void in
                
            })
            
            
        } else {//删除
            
            ProgressHUD.show("")
            
            let discussQuery = AVQuery(className: "discuss")
            discussQuery.whereKey("BookObject", equalTo: object)
            discussQuery.findObjectsInBackgroundWithBlock({ (results, error) -> Void in
                for Book in results {
                    let BookObject = Book as? AVObject
                    BookObject?.deleteInBackground()
                }
            })
            
            let loveQuery = AVQuery(className: "Love")
            loveQuery.whereKey("BookObject", equalTo: object)
            loveQuery.findObjectsInBackgroundWithBlock({ (results, error) -> Void in
                for Book in results {
                    let BookObject = Book as? AVObject
                    BookObject?.deleteInBackground()
                }
            })
            
            object?.deleteInBackgroundWithBlock({ (success, error) -> Void in
                if success {
                    ProgressHUD.showSuccess("删除成功")
                    self.dataArr.removeObjectAtIndex((indexPath?.row)!)
                    self.tableView?.reloadData()
                } else {
                
                }
            })
            
            
        }
        
        
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
        
        cell?.rightUtilityButtons = self.returnRightBtn()
        cell?.delegate = self
        
        
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
