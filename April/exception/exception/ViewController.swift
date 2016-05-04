//
//  ViewController.swift
//  exception
//
//  Created by liuhj on 16/5/4.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    enum LoginError : ErrorType {
        case UserNameNotFound, UserNameOrPasswordNotMatch
    }

    
    let users : NSDictionary = ["tony" : "123456", "jackey" : "654321"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try login("sj", password: "af")
        } catch LoginError.UserNameNotFound {
            print("UserNotFound")
        } catch LoginError.UserNameOrPasswordNotMatch {
            print("UserPasswordNotMatch")
        } catch _ {
        
        }
        
    }
    
    
    func login(userName: String, password: String) throws {
        var flag : Bool?
        for key in users.allKeys {
            if userName != key as! String {
                flag = false
            } else {
                flag = true
            }
        }
        if flag == false {
            throw LoginError.UserNameNotFound
        }
        
        if users[userName] as! String != password {
            throw LoginError.UserNameOrPasswordNotMatch
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}

