//
//  HJMoreViewController.swift
//  Xbook
//
//  Created by liuhj on 16/1/20.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJMoreViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    var tableView : UITableView?
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame: self.view.frame, style: .Plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView?.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell?.textLabel?.text = "more \(indexPath.row)"
        
        return cell!
    }
    
    
    
    
    

}
