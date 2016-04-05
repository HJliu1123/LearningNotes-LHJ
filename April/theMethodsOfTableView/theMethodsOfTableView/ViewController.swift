//
//  ViewController.swift
//  theMethodsOfTableView
//
//  Created by liuhj on 16/4/4.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView : UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView()
        self.tableView?.frame = self.view.frame
        self.tableView?.backgroundColor = UIColor.grayColor()
        //设置头视图和尾视图的高度
        self.tableView?.sectionFooterHeight = 50
        self.tableView?.sectionHeaderHeight = 50
        //是否允许编辑
        self.tableView?.editing = true
        //当控制某一行的时候，是否可以编辑
        self.tableView?.allowsSelectionDuringEditing = false
        //是否可以选择多行
        self.tableView?.allowsMultipleSelection = false
        //在非编辑状态下是否可以选中
        self.tableView?.allowsSelection = false
        //选择多行的时候是否可以编辑
        self.tableView?.allowsMultipleSelectionDuringEditing = false
        //显示某个组索引列表在右边，当行数达到这个值时，默认是NSInteger最大值
        self.tableView?.sectionIndexMinimumDisplayRowCount = 60
        //选择某个部分的某行改变这一行的文本颜色
        self.tableView?.sectionIndexColor = UIColor.redColor()
        //选择某个部分的背景颜色
        self.tableView?.sectionIndexBackgroundColor = UIColor.greenColor()
        //设置单元格分割线的样式 
        //UITableViewCellSeparatorStyleNone,
        //UITableViewCellSeparatorStyleSingleLine,
        //UITableViewCellSeparatorStyleSingleLineEtched
        self.tableView?.separatorStyle = .None
        //设置单元格分割线的样式
        self.tableView?.separatorColor = UIColor.blueColor()
        //设置头部视图
        self.tableView?.tableHeaderView = UIView()
        //设置尾部视图
        self.tableView?.tableFooterView = UIView()
        
        //设置代理
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        //注册cell标识
        self.tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(self.tableView!)
        
    }
    
    
    
    
    /**
     * UITableViewDataSource
     */
    //返回有多少个section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //返回每个section有多少个cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    //设置每个cell显示的内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //重用cell
        let cell = self.tableView?.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell!
    }
    //设置cell是否可以编辑
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    //设置cell是否可以移动
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    //设置表头标签
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header"
    }
    //设置表尾标签
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "footer"
    }
    //添加右边的索引（A~Z），只能在默认样式（UITableViewStylePlain）中，
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return ["s1","s2"]
    }
    //根据给定的标题获取section的索引
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return 10
    }
    //操作单元格（删除，添加，移动）
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //添加
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        //删除
        self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
        //移动
        self.tableView?.moveRowAtIndexPath(indexPath, toIndexPath: indexPath)
        
    }
    
    
    
    
    
    /**
     * UITableViewDelegate
     */
    //选中某个cell调用
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("%ld",indexPath.row)
    }
    //将要显示cell,
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    //设置行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    //设置section头的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    //设置section尾的高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    //自定义表头视图
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        headView.backgroundColor = UIColor.redColor()
        return headView
    }
    //自定义表尾视图
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        footView.backgroundColor = UIColor.greenColor()
        return footView

    }
    //设置某个单元格右边指向按钮的响应方法
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        
    }
    
    //获取将要选中的单元格的indexPath
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    
    //获取将要未选中的单元格的indexPath
    func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    
    //获取未选中的单元格的响应事件
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
}

