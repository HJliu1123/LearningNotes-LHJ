//
//  HJConnectTableViewController.swift
//  通讯录
//
//  Created by liuhj on 16/4/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJConnectTableViewController: UITableViewController {
    
    //懒加载
    lazy var connArray : NSArray = {
        HJDictToModelTool.getConnArr()
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.connArray = HJDictToModelTool.getConnArr()
        
        
        
        
        
        
    }

    
    
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.connArray.count)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        let conn : HJConnect?
        conn = self.connArray[indexPath.row] as? HJConnect
        
        cell.textLabel?.text = conn!.name
        cell.detailTextLabel?.text = conn!.telNum
        
        
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
    }


    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

}
