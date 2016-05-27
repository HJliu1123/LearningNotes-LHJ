//
//  HJDictToModelTool.swift
//  通讯录
//
//  Created by liuhj on 16/4/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJDictToModelTool: NSObject {
//
//    static func dataTool(dict : NSDictionary) ->AnyObject {
//        
//        let conn = HJConnect()
//        conn.name = dict["name"] as? String
//        conn.telNum = dict["telNum"] as? String
//        conn.email = dict["email"] as? String
//        conn.addr = dict["addr"] as? String
//        
//        
//        
//        return conn
//    }
    
    class func getConnArr() ->NSArray {
        
        let connArray = NSMutableArray()
        
            let path = NSBundle.mainBundle().pathForResource("ConnectList", ofType: "plist")
            
            let arr = NSArray.init(contentsOfFile: path!)
            
            
            
            for dict in arr! {
                
                let conn =  HJConnect()
                conn.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
                connArray.addObject(conn)
                
            }
            
            return connArray.copy() as! NSArray
    }
    
}
