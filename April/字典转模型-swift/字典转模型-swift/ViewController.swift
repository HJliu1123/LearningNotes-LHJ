//
//  ViewController.swift
//  字典转模型-swift
//
//  Created by liuhj on 16/4/6.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView : UITableView?
    var connArr : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.frame)
        tableView?.dataSource = self
        tableView?.delegate = self
        self.view.addSubview(tableView!)
        
        tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        self.connArr = self.getConnArr()
        
        
    }
    
    func getConnArr() ->NSArray {
        
        let connArray = NSMutableArray()
        
        if connArr == nil {
            
            
            
            let path = NSBundle.mainBundle().pathForResource("ConnectList", ofType: "plist")
            
            let arr = NSArray.init(contentsOfFile: path!)
            
            
            
            for dict in arr! {
                
                let conn =  HJConnect()
                conn.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
                connArray.addObject(conn)
                
            }
            
            
        }
        
        return connArray.copy() as! NSArray
        
    }
    
    
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (connArr?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let conn = connArr![indexPath.row]
        
        
        cell.textLabel?.text = conn.name
        
        
        
        
        return cell
        
        
    }
    
    

}

