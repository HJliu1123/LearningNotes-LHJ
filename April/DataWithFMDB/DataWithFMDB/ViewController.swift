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
        print(filePath)
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
    
    func insertData(stu : Student) {
        _db?.open()
        let array : [AnyObject] = [stu.id!, stu.name!, stu.age!]
        let result = _db?.executeUpdate("INSERT INTO t_student (id, name, age) VALUE (?, ?, ?);", withArgumentsInArray: array)
        if (result != nil) {
            print("success: \(stu.id)")
        } else {
            print("error: \(_db?.lastErrorMessage())")
        }
        
        _db?.close()
        
        
    }
    
    
    func deleteData(stu : Student) {
        _db?.open()
        let result = _db?.executeUpdate("DELETE FROM t_student WHERE id = (?)", withArgumentsInArray: [stu.id!])
        if (result != nil) {
            print("success: \(stu.id)")
        } else {
            print("failed: \(_db?.lastErrorMessage())")
        }
        _db?.close()
    }
    
    func updateData(stu : Student) {
        _db?.open()
        let array : [AnyObject] = [stu.name!, stu.sex!, stu.age!, stu.id!]
        let result = _db?.executeUpdate("PUDATE t_student SET name = (?), sex = (?), age = (?) WHERE id = (?)", withArgumentsInArray: array)
        if (result != nil) {
            print("success: \(stu.id)")
        } else {
            print("failed: \(_db?.lastErrorMessage())")
        }
        _db?.close()
    }
    
    func selectData() -> Array<Student> {
        _db?.open()
        var stus = [Student]()
        let result = _db?.executeQuery("SELELCT id, name, sex, age FROM t_student", withArgumentsInArray: nil)
        if (result != nil) {
            while ((result?.next()) != nil) {
                let id = Int((result?.intForColumn("id"))!)
                let name = (result?.stringForColumn("name"))! as String
                let sex = (result?.stringForColumn("sex"))! as String
                let age = Int((result?.intForColumn("age"))!)
                let stu = Student(id: id, name: name, sex: sex, age: age)
                stus.append(stu)
            }
        } else {
            print("failed: \(_db?.lastErrorMessage())")
        }
        _db?.close()
        return stus
    }
    
    
    
    
    
    
}

