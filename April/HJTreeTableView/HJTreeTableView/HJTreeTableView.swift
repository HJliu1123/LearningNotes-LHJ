//
//  HJTreeTableView.swift
//  HJTreeTableView
//
//  Created by liuhj on 16/4/21.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

protocol HJTreeTableViewDelegate {
    
    func cellClick(node : HJNode)
    
}


class HJTreeTableView: UITableView, UITableViewDelegate, UITableViewDataSource{
    
    var treeDelegate : HJTreeTableViewDelegate!
    
    var dataArr : NSArray?
    
    var tempData : NSMutableArray?
    
    init(frame: CGRect, data: NSArray) {
        super.init(frame: frame, style: .Plain)
        
        self.delegate = self
        self.dataSource = self
        dataArr = data
        tempData = self.createTempData(data)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTempData(data : NSArray) ->NSMutableArray {
        
        let tempArr  = NSMutableArray()
        for i in 0 ..< data.count {
            let node = dataArr!.objectAtIndex(i) as? HJNode
            if (node!.expand != nil) {
                tempArr.addObject(node!)
            }
        }
        
        
        return tempArr
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tempData?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        let node = tempData?.objectAtIndex(indexPath.row) as? HJNode
        
        cell?.indentationLevel = (node?.depth)!
        cell?.indentationWidth = 30.0
        
        cell?.textLabel?.text = node?.nodeName
        
        return cell!
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let parentNode = tempData?.objectAtIndex(indexPath.row) as? HJNode
        if treeDelegate != nil {
            treeDelegate.cellClick(parentNode!)
        }
        
        let startPosition = indexPath.row + 1
        var endPosition = startPosition
        var expand = false
        for var i in 0 ..< dataArr!.count {
            var node : HJNode?
            node = dataArr!.objectAtIndex(i) as? HJNode
            if node!.parentId == parentNode!.nodeId {
                if (node!.expand != nil) {
                    node?.expand = false
                } else {
                    node?.expand = true
                }
                if (node!.expand != nil) {
                    tempData!.insertObject(node!, atIndex: endPosition)
                    expand = true
                    endPosition += 1
                } else {
                    expand = false
                    endPosition = self.removeAllNotesAtParentNote(parentNode!)
                    break
                }
            }
        }
        
        let indexPathArray = NSMutableArray()
        for var i = startPosition; i < endPosition; i += 1 {
            let tempIndexPath = NSIndexPath.init(forRow: i, inSection: 0)
            indexPathArray.addObject(tempIndexPath)
        }
        
        if expand {
            self.insertRowsAtIndexPaths(indexPathArray.copy() as! [NSIndexPath], withRowAnimation: .None)
        } else {
            self.deleteRowsAtIndexPaths(indexPathArray.copy() as! [NSIndexPath], withRowAnimation: .None)
        }
    
    }
    
    func removeAllNotesAtParentNote(parentNote: HJNode) -> NSInteger {
        let startPosition = tempData?.indexOfObject(parentNote)
        var endPosition = startPosition
        
        for var i = startPosition!; i < endPosition; i += 1 {
            let node = tempData?.objectAtIndex(i) as? HJNode
            endPosition = endPosition! + 1
            if (node?.depth)! <= (tempData?.count)! - 1 {
                break
            }
            if endPosition! == (tempData?.count)! - 1 {
                endPosition = endPosition! + 1
                node?.expand = false
                break
            }
            node?.expand = false
        }
        if endPosition > startPosition {
            tempData?.removeObjectsInRange(NSRange.init(location: startPosition! + 1, length: endPosition! - startPosition! - 1))
        }
        
        
        return endPosition!
        
    }

    
    

}
