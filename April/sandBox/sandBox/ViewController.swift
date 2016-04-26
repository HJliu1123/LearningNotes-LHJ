//
//  ViewController.swift
//  sandBox
//
//  Created by liuhj on 16/4/26.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取沙盒的路径
        let path = self.getSandBoxPath()
        
        //将数据写入沙盒
        //写入数据的时候可能会出现写入异常，如：磁盘满了，使用异常机制
        do {
            try self.writeFileToSandBox(path as String)
        } catch let error as NSError {
            print("error : \(error.domain)")
        }
        
        
        
        
        
    }
    
    //获取沙盒的路径
    func getSandBoxPath() -> NSString {
        
        let homeDirectory = NSHomeDirectory()
        print(homeDirectory)
        //第一个参数：要搜索的路径
        //第二个参数：制定域
        //第三个参数：true（绝对路径），false（相对路径）
        let documentArr = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentStr = documentArr.first
        print(documentStr?.stringByAppendingString("/test.txt"))
        
        let libStr = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true).first
        print(libStr)
        
        let tempStr = NSTemporaryDirectory()
        print(tempStr)
        
        return documentStr!
        
    }
    
    //将数据写入沙盒
    func writeFileToSandBox(path : String) throws {
        
        let contentStr : NSString = "测试内容"
        
        let strFilePath = path.stringByAppendingString("/test.txt")
        
        try contentStr.writeToFile(strFilePath, atomically: true, encoding: NSUTF8StringEncoding)
        
        
        let contentArr : NSArray = ["dsf", "lsjd", "20"]
        
        let arrFilePath = path.stringByAppendingString("/arr.txt")
        
        contentArr.writeToFile(arrFilePath, atomically: true)
        
        
        
    }
    
    
    
    
    
    
    

}

