//
//  ViewController.swift
//  DataWithFMDB
//
//  Created by liuhj on 16/5/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _db : FMDatabase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTable()
        
    }
    
    func createTable() {
        let docPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
        let filePath = docPath?.stringByAppendingString("/test.sqlite")
        
        _db = FMDatabase(path: filePath)
        //"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"
        if _db!.open() {
            do {
                try _db!.executeUpdate("CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);", values: nil)
            } catch let error as NSError {
                print(error.userInfo)
            }
        }
    }
    
    func insertData() {
//        do {
//            try _db?.executeUpdate("INSERT INTO t_student (name, age) VALUE (?, ?);", values: nil)
//        } catch let error as NSError {
//            print(error.userInfo)
//        }
        
        do {
            try _db?.executeUpdate("INSERT INTO t_student (name, age) VALUE (?, ?);", withParameterDictionary: [Student().name!:"tony",Student().age!:12])
        } catch let error as NSError {
            print(error.userInfo)
        }
        
    }
    

}

