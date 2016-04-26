//
//  ViewController.swift
//  HJTreeTableView
//
//  Created by liuhj on 16/4/21.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HJTreeTableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTreeTable()
        
        
        
        
    }
    
    func setTreeTable() {
        
        let country1 = HJNode().setNode(-1, nodeId: 0, nodeName: "中国", depth: 0, expand: true)
        let province1 = HJNode().setNode(0, nodeId: 1, nodeName: "广东", depth: 1, expand: false)
        let city1 = HJNode().setNode(1, nodeId: 2, nodeName: "深圳", depth: 2, expand: false)
        
        
        
        
        let country2 = HJNode().setNode(-1, nodeId: 10, nodeName: "美国", depth: 0, expand: true)
        
        
        
        
        
        
        
        let country3 = HJNode().setNode(-1, nodeId: 17, nodeName: "日本", depth: 0, expand: true)
        
        
        
        let data = NSArray(array: [country1, province1, city1, country2,country3])
        
        let tableView = HJTreeTableView(frame: CGRectMake(0, 20, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 20), data: data)
        tableView.treeDelegate = self
        self.view.addSubview(tableView)
        
        
    }
    
    func cellClick(node: HJNode) {
        
    }
    

}

