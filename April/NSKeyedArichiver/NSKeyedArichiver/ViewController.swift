//
//  ViewController.swift
//  NSKeyedArichiver
//
//  Created by liuhj on 16/5/3.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.writeBasicData()
        
        
    }
    
    func getDocumentPath() -> String {
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        return documentPath.first!
    }
    
    
    //简单归档
    func writeBasicData() {
        
        let filePath = self.getDocumentPath().stringByAppendingString("atany.archiver")
        let flag = NSKeyedArchiver.archiveRootObject("归档", toFile: filePath)
        
        if flag {
            print("success")
            NSKeyedUnarchiver.unarchiveObjectWithFile(filePath)
        } else {
            print("failed")
        }
    }
    //集合对象归档
    func writeMixedData() throws {
        let array = ["name", "age"]
        let stuArray = ["tony", 19, ["Objc", "HTML5"]]
        let mutableData = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: mutableData)
        archiver.encodeObject(array, forKey: "firstArray")
        archiver.encodeObject(stuArray, forKey: "secondArray")
        archiver.finishEncoding()
        
        try mutableData.writeToFile(self.getDocumentPath(), options: .DataWritingAtomic)
        
        
    }
    
    func readMixedData() {
        let data = NSData.init(contentsOfFile: self.getDocumentPath())
        let unarchiver = NSKeyedUnarchiver.init(forReadingWithData: data!)
        let firstArray = unarchiver.decodeObjectForKey("firstArray")
        let secondArray = unarchiver.decodeObjectForKey("secondArray")
        unarchiver.finishDecoding()
        print(firstArray)
        print(secondArray)
    }
    
    func writeCustomObjectData() throws {
        
        let data = NSMutableData()
        let person = HJPerson(name: "tony", age: 18)
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(person, forKey: "person")
        archiver.finishEncoding()
        let filePath = self.getDocumentPath().stringByAppendingString("archiving")
        try data.writeToFile(filePath, options: .DataWritingAtomic)
        
    }
    
    func readCustomObjectData() {
        
        let readData = NSData(contentsOfFile: self.getDocumentPath().stringByAppendingString("archiving"))
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: readData!)
        let person = unarchiver.decodeObjectForKey("person") as? HJPerson
        unarchiver.finishDecoding()
        print(person)
        
    }
    
    

}

