//
//  ViewController.swift
//  NSUserDefault
//
//  Created by liuhj on 16/5/3.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userName : NSString?
    var password : NSString?
    let userDefault = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setData()
        
        self.login()
        
        self.deleteData()
        
        
    }
    
    func setData() {
        
        
        userDefault.setObject("user", forKey: "userName")
        userDefault.setObject("psd", forKey: "password")
    }
    
    
    func login() {
        
        userName = userDefault.valueForKey("userName") as? NSString
        password = userDefault.valueForKey("password") as? NSString
        
        if userName == "user" && password == "psd" {
            print("login success")
        } else {
            print("faile")
        }
        
        
    }
    
    func deleteData() {
        userDefault.removeObjectForKey("userName")
        userDefault.removeObjectForKey("password")
    }
    
    
    
    
    

}

