//
//  HJPerson.swift
//  NSKeyedArichiver
//
//  Created by liuhj on 16/5/4.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJPerson: NSObject, NSCoding{
    
    var name : NSString?
    var age : NSNumber?
    
    init(name: NSString, age: NSNumber) {
        super.init()
        self.name = name
        self.age = age
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: "name")
        
        aCoder.encodeObject(age, forKey: "age")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init()
        
        name = aDecoder.decodeObjectForKey("name") as? NSString
        age = aDecoder.decodeObjectForKey("age") as? NSNumber
        
    }
    
    
    
    
    
}
