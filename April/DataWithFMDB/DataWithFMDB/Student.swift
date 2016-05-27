//
//  Student.swift
//  DataWithFMDB
//
//  Created by liuhj on 16/5/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class Student: NSObject {

    var id : Int?
    var name : String?
    var sex : String?
    var age : Int?
    
    init(id : Int, name : String, sex : String, age : Int) {
        self.id = id
        self.name = name
        self.sex = sex
        self.age = age
    }
    
}
