//
//  HJNode.swift
//  HJTreeTableView
//
//  Created by liuhj on 16/4/21.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJNode: NSObject {
    //父节点的id，若为-1则表示为根节点
    var parentId : NSInteger?
    //本节点的id
    var nodeId : NSInteger?
    //本节点名称
    var nodeName : String?
    //该节点深度
    var depth : NSInteger?
    //该节点是否处于展开状态
    var expand : Bool?
    
    
    func setNode(parentId : NSInteger, nodeId : NSInteger, nodeName : String, depth : NSInteger, expand : Bool) -> HJNode {
        
        let node = HJNode()
        node.parentId = parentId
        node.nodeId = nodeId
        node.nodeName = nodeName
        node.depth = depth
        node.expand = expand
        return node
    }
    
    
    
    
    
}
