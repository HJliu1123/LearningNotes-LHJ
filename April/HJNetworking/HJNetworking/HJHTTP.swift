//
//  HJHTTP.swift
//  HJNetworking
//
//  Created by liuhj on 16/4/5.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

enum RequestMethod {
    case Post
    case Get
}

typealias aht = HJHTTP

class HJHTTP: NSObject {

    private var method : RequestMethod
    
    private let hostName = ""
    
    private var curUrl = ""
    
    private var parameters : [String : AnyObject] = [ : ]
    
    static let shareInstance = HJHTTP(m : .Get)
    
    init(m : RequestMethod) {
        method = m
        super.init()
        setDefaultParas()
    }
    
    private func setDefaultParas() {
        self.parameters = [ : ]
        
        _ = defaultParameter().reduce("",combine :{(str, p) ->String in
            self.parameters[p.0] = p.1
            return ""
        })
    }
    
    func fetch(url : String) ->HJHTTP {
        setDefaultParas()
        curUrl = "\(hostName)\(url)"
        self.method = .Get
        return self
    }
    
    func post(url : String) ->HJHTTP {
        setDefaultParas()
        curUrl = "\(hostName)\(url)"
        self.method = .Post
        return self
    }
    
    func paras(p : [String : AnyObject]) ->HJHTTP {
        _ = p.reduce("") { (str, p) -> String in
            parameters[p.0] = p.1
            return ""
        }
        return self
    }
    
    func go(success : String ->Void, failure : NSError? ->Void) {
        var smethod = ""
        if method == .Get {
            smethod = "GET"
        } else {
            smethod = "POST"
        }
        
        HJNet.request(smethod, url: curUrl, from: parameters, success: { (data) -> Void in
            print("request successed in \(self.curUrl)")
            let result = String(data: data!, encoding: NSUTF8StringEncoding)
            success(result!)
            }) { (error) -> Void in
                print("request failed in \(self.curUrl)")
                failure(error)
                
        }
        
    }
    
    func defaultParameter() ->[String : AnyObject] {
        var result : [String : AnyObject] = [ : ]
        let version = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"]
        result["version"] = version
        result["app_type"] = "HJNetworking"
        return result
    }
    
    
    
    
    
    
}
