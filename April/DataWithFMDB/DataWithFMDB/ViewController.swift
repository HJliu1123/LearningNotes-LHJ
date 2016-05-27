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
    var filePath : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTable()
        
    }
    //创建表
    func createTable() {
        let docPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
        filePath = docPath?.stringByAppendingString("/test.sqlite")
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
    //插入
    func insertData(stu : Student) {
        _db?.open()
        let array : [AnyObject] = [stu.id!, stu.name!, stu.sex!, stu.age!]
        let result = _db?.executeUpdate("INSERT INTO t_student (id, name, sex, age) VALUE (?, ?, ?, ?);", withArgumentsInArray: array)
        if (result != nil) {
            print("success: \(stu.id)")
        } else {
            print("error: \(_db?.lastErrorMessage())")
        }
        
        _db?.close()
        
        
    }
    
    //删除
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
    //改
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
    //查询
    func selectData() -> Array<Student> {
        _db?.open()
        var stus = [Student]()
        //返回结果是set
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
    //线程安全的
    /*
     FMDatabaseQueue虽然看似一个队列，实际上它本身并不是，它通过内部创建一个Serial的dispatch_queue_t来处理通过inDatabase和inTransaction传入的Blocks，所以当我们在主线程（或者后台）调用inDatabase或者inTransaction时，代码实际上是同步的。FMDatabaseQueue这么设计的目的是让我们避免发生并发访问数据库的问题，因为对数据库的访问可能是随机的（在任何时候）、不同线程间（不同的网络回调等）的请求。内置一个Serial队列后，FMDatabaseQueue就变成线程安全了，所有的数据库访问都是同步执行，而且这比使用@synchronized或NSLock要高效得多。
     
     但是这么一来就有了一个问题：如果后台在执行大量的更新，而主线程也需要访问数据库，虽然要访问的数据量很少，但是在后台执行完之前，还是会阻塞主线程。
     */
    func safeAddData(stu : Student) {
        let queue : FMDatabaseQueue = FMDatabaseQueue(path: filePath)
        queue.inDatabase { (_db : FMDatabase!) in
            _db.open()
            let array : [AnyObject] = [stu.id!, stu.name!, stu.sex!, stu.age!]
            let result = _db?.executeUpdate("INSERT INTO t_student (id, name, sex, age) VALUE (?, ?, ?, ?);", withArgumentsInArray: array)
            if (result != nil) {
                print("success: \(stu.id)")
            } else {
                print("error: \(_db?.lastErrorMessage())")
            }
            
            _db?.close()
        }
        
        
        
        
        
    }
    
    
    
    
}

