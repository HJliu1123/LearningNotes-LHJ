//
//  HJNet.swift
//  HJNetworking
//
//  Created by liuhj on 16/4/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJNet: NSObject {
    
    
    
    
    class func request(method : String = "GET", url : String, from : Dictionary<String, AnyObject> = [ : ], success : (data : NSData?) ->Void, fail : (error : NSError?) ->Void) {
        
        var innerUrl = url
        
        if method == "GET" {
            innerUrl += "?" + HJNet().buildParams(from)
        }
        
        let rep = NSMutableURLRequest(URL: NSURL(string: innerUrl)!)
        
        rep.HTTPMethod = method
        
        if method == "POST" {
            rep.addValue("application/x-www-from-urlencoded", forHTTPHeaderField: "Content-Type")
            print("POST PARAMS \(from)")
            rep.HTTPBody = HJNet().buildParams(from).dataUsingEncoding(NSUTF8StringEncoding)
        }
        
        let session = NSURLSession.sharedSession()
        
        print(rep.description)
        
        let task = session.dataTaskWithRequest(rep) { (data, response, error) -> Void in
            if error != nil {
                fail(error: error)
                print(response)
            } else {
                if (response as! NSHTTPURLResponse).statusCode == 200 {
                    success(data: data)
                } else {
                    fail(error: error)
                    print(response)
                }
            }
        }
        
        task.resume()
        
        
    }
    
    func buildParams(parameters : [String : AnyObject]) ->String {
        
        var components : [(String, String)] = []
        
        for key in Array(parameters.keys).sort() {
            let value : AnyObject! = parameters[key]
            components += self.queryComponent(key, value)
        }
        
        
        
        return (components.map{ "\($0)=\($1)"} as [String]).joinWithSeparator("&")
    }
    
    func queryComponent(key : String, _ value : AnyObject) ->[(String, String)] {
        var components : [(String, String)] = []
        if let dictionary = value as? [String : AnyObject] {
            for (nestedKey, value) in dictionary {
                components += queryComponent("\(key)[\(nestedKey)]", value)
            }
        } else if let array = value as? [AnyObject] {
            for value in array {
                components += queryComponent("\(key)", value)
            }
        } else {
            components.appendContentsOf([(escape(key), escape("\(value)"))])
        }
        return components
    }
    
    
    
    
    func escape(string :String) ->String {
        let legalURLCharactersToBeEscape : CFStringRef = ":&=;=!@#$()',*"
        return CFURLCreateStringByAddingPercentEscapes(nil, string, nil, legalURLCharactersToBeEscape, CFStringBuiltInEncodings.UTF8.rawValue) as String
        
//        let str = ":&=;=!@#$()',*"
//        
//        var set : NSCharacterSet?
//        
//        NSCharacterSet.init(charactersInString: str)
//        
//        let s = string.stringByAddingPercentEncodingWithAllowedCharacters(set!)
//        
//        
//        
//        return s!
    }
    
    
    
    
    
    
}
