//
//  HJPushViewController.swift
//  Xbook
//
//  Created by liuhj on 16/1/20.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJPushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //设置导航栏
    func setNavigationBar() {
        
        let navigationView = UIView(frame: CGRectMake(0, -20, SCREEN_WIDTH,65))
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
    

}
