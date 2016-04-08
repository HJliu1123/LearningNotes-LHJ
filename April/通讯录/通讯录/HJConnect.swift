//
//  HJConnect.swift
//  通讯录
//
//  Created by liuhj on 16/4/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJConnect: NSObject {
    
    var name : String?
    var telNum : String?
    var email : String?
    var addr : String?
    
//    func initWithDict(dict : NSDictionary) ->HJConnect {
//        
//        self.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
//        
//        return self
//        
//    }
    
    class func connectWithDict(dict : NSDictionary) ->HJConnect {
        
        let conn = HJConnect()
        
//        conn.initWithDict(dict)
        conn.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
        
        return conn
        
    }

    
    
}
