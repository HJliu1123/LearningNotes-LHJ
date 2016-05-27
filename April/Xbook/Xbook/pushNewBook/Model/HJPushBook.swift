//
//  HJPushBook.swift
//  Xbook
//
//  Created by liuhj on 16/3/13.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJPushBook: NSObject {
    
    static func pushBookInBack(dict : NSDictionary, object: AVObject) {
        
//        let object = AVObject(className: "Book")
        object.setObject(dict["BookName"], forKey: "BookName")
        object.setObject(dict["BookEditor"], forKey: "BookEditor")
//        object.setObject(dict["BookCover"], forKey: "BookCover")
        object.setObject(dict["title"], forKey: "title")
        object.setObject(dict["score"], forKey: "score")
        object.setObject(dict["type"], forKey: "type")
        object.setObject(dict["detaileType"], forKey: "detaileType")
        object.setObject(dict["description"], forKey: "description")
        object.setObject(AVUser.currentUser(), forKey: "user")
        
        let cover = dict["BookCover"] as? UIImage
        let coverFile = AVFile(data: UIImagePNGRepresentation(cover!))
        coverFile.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                object.setObject(coverFile, forKey: "cover")
                object.saveEventually({ (success, error) -> Void in
                    if success {
                        NSNotificationCenter.defaultCenter().postNotificationName("pushBookNotification", object: nil, userInfo: ["success" : "true"])
                    } else {
                        NSNotificationCenter.defaultCenter().postNotificationName("pushBookNotification", object: nil, userInfo: ["success" : "false"])
                    }
                })
            } else {
                NSNotificationCenter.defaultCenter().postNotificationName("pushBookNotification", object: nil, userInfo: ["success" : "false"])
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
