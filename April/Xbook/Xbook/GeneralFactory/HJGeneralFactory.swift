//
//  HJGeneralFactory.swift
//  Xbook
//
//  Created by liuhj on 16/1/20.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJGeneralFactory: NSObject {
    
    static func addTitleWithTitle(target:UIViewController, title1:String = "关闭", title2:String = "确认") {
        
        let button1 = UIButton(frame: CGRectMake(10, 20, 40, 20))
        button1.setTitle(title1, forState: .Normal)
        button1.contentHorizontalAlignment = .Left
        button1.setTitleColor(MAIN_RED, forState: .Normal)
        button1.titleLabel?.font = UIFont(name: MY_FONT, size: 14)
        button1.tag = 1234
        target.view.addSubview(button1)
        
        
        let button2 = UIButton(frame: CGRectMake(SCREEN_WIDTH - 50, 20, 40, 20))
        button2.setTitle(title2, forState: .Normal)
        button2.contentHorizontalAlignment = .Right
        button2.setTitleColor(MAIN_RED, forState: .Normal)
        button2.titleLabel?.font = UIFont(name: MY_FONT, size: 14)
        button2.tag = 1235
        target.view.addSubview(button2)
        
        button1.addTarget(target, action: #selector(NSStream.close), forControlEvents: .TouchUpInside)
        button2.addTarget(target, action: Selector("sure"), forControlEvents: .TouchUpInside)

        
    }
    
    
    
    
    
    
    
    
    
    

}
