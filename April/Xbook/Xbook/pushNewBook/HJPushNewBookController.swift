//
//  HJPushNewBookController.swift
//  Xbook
//
//  Created by liuhj on 16/1/20.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJPushNewBookController: UIViewController,BookTitleDelegate,HJPhotoPickerDelegate,VPImageCropperDelegate,UITableViewDataSource,UITableViewDelegate{

    var bookTitleView : HJBookTitleView?
    
    var tableView : UITableView?
    
    var titleArray : Array<String> = []
    
    var book_Title = ""
    
    var score : LDXScore?
    
    var type = "文学"
    
    var detailType = "文学"
    
    var book_Description = ""
    
    var BookObject : AVObject?
    var fixType : String?
    
    var showScore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.bookTitleView = HJBookTitleView(frame: CGRectMake(0, 40, SCREEN_WIDTH, 160))
        self.bookTitleView?.delegate = self
        self.view.addSubview(self.bookTitleView!)
        
        self.tableView = UITableView(frame: CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HIGHT - 200), style: .Grouped)
        //是没有内容的线条消失
        self.tableView?.tableFooterView = UIView()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView?.backgroundColor = UIColor(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.view.addSubview(self.tableView!)
        self.titleArray = ["标题","评分","分类","书评"]
        
        self.score = LDXScore(frame: CGRectMake(100,10,100,22))
        self.score?.isSelect = true
        self.score?.normalImg = UIImage(named: "btn_star_evaluation_normal")
        self.score?.highlightImg = UIImage(named: "btn_star_evaluation_press")
        self.score?.max_star = 5
        self.score?.show_star = 5
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HJPushNewBookController.pushBookNotification(_:)), name: "pushBookNotification", object: nil)
        
    }
    
    func fixBook() {
        
        if self.fixType == "fix" {
            self.bookTitleView?.bookName?.text = self.BookObject!["BookName"] as? String
            self.bookTitleView?.bookEditor?.text = self.BookObject!["BookEditor"] as? String
            let coverFile = self.BookObject!["cover"] as? AVFile
            coverFile?.getDataInBackgroundWithBlock({ (data, error) -> Void in
                self.bookTitleView?.bookCover?.setImage(UIImage(data: data), forState: .Normal)
            })
            
            self.book_Title = (self.BookObject!["title"] as? String)!
            self.type = (self.BookObject!["type"] as? String)!
            self.detailType = (self.BookObject!["detailType"] as? String)!
            self.book_Description = (self.BookObject!["description"] as? String)!
            self.score?.show_star = (Int)((self.BookObject!["score"] as? String)!)!
            if self.book_Description != "" {
                self.titleArray.append("")
            }
            
        }
        
        
    }
    
    
    
    func pushBookNotification(notification: NSNotification) {
        let dict = notification.userInfo
        if (String(dict!["success"]!)) == "true" {
            if self.fixType == "fix" {
                ProgressHUD.showSuccess("修改成功")
            } else {
                ProgressHUD.showSuccess("上传成功")
            }
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
        } else {
            ProgressHUD.showError("上传失败")
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    
    
    
    
    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func sure() {
        
        
        let dict = [
            "BookName" : (self.bookTitleView?.bookName?.text)!,
            "BookEditor" : (self.bookTitleView?.bookEditor?.text)!,
            "BookCover" : (self.bookTitleView?.bookCover?.currentImage)!,
            "title" : self.book_Title,
            "score" : String((score?.show_star)!),
            "type" : self.type,
            "detaileType" : self.detailType,
            "description" : self.book_Description
        ]
        
        ProgressHUD.show("")
        if self.fixType == "fix" {
            HJPushBook.pushBookInBack(dict, object: BookObject!)
        }
        
        
    }
    /*
        BookTitleDelegate
    */
    func choiceCover() {
        
        let vc = HJPhotoPickerController()
        vc.delegate = self
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
        
    }
    
    func getImageFromPicker(image: UIImage) {
        
//        self.bookTitle?.bookCover?.setImage(image, forState: .Normal)
        
        let croVC = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH * 1.273), limitScaleRatio: 3)
        croVC.delegate = self
        self.presentViewController(croVC, animated: true) { () -> Void in
            
        }
    }
    
    /*
    *VPImageDelegate
    */
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        self.bookTitleView?.bookCover?.setImage(editedImage, forState: .Normal)
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        
        cropperViewController.dismissViewControllerAnimated(true) { 
            
        }
        
    }
    
    /**
    *  UITableViewDataSource,UITableViewDelegate
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        //移除cell中的所有内容
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        if(indexPath.row != 1) {
            cell.accessoryType = .DisclosureIndicator
        }
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: MY_FONT, size: 15)
        cell.detailTextLabel?.font = UIFont(name: MY_FONT, size: 13)
        
        
        var row = indexPath.row
        if self.showScore && row > 1 {
            row -= 1
        }
        switch row {
        case 0:
            cell.detailTextLabel?.text = self.book_Title
            break
        case 2:
            cell.detailTextLabel?.text = self.type + "->" + self.detailType
            break
        case 4:
            cell.accessoryType = .None
            let commentView = UITextView(frame: CGRectMake(4, 4, SCREEN_WIDTH - 8, 80))
            commentView.text = self.book_Description
            commentView.font = UIFont(name: MY_FONT, size: 14)
            commentView.editable = false
            cell.contentView.addSubview(commentView)
            break
        default:
            break
        }
        
        if self.showScore && indexPath.row == 2 {
            cell.contentView.addSubview(self.score!)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if showScore && indexPath.row >= 5 {
            return 88
        } else if !self.showScore && indexPath.row >= 4 {
            return 88
        } else {
            return 44
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        
        var row = indexPath.row
        if self.showScore && row > 1 {
            row -= 1
        }
        
        switch indexPath.row {
        case 0:
            self.tableViewSeleteTitle()
            break
        case 1:
            self.tableViewSeleteScore()
            break
        case 2:
            self.tableViewSeleteType()
            break
        case 3:
            self.tableViewSeleteDescription()
            break
        default:
            break
        }

    }
    
    /**
    *   选择标题
    */
    func tableViewSeleteTitle() {
        let vc = HJPushTitleViewController()
        HJGeneralFactory.addTitleWithTitle(vc)
        vc.callBack = ({(Title:String)->Void in
            self.book_Title = Title
            self.tableView?.reloadData()
        })
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
    /**
    *   选择评分
    */
    func tableViewSeleteScore() {
        
        self.tableView?.beginUpdates()
        
        let tempIndexPath = [NSIndexPath(forRow: 2, inSection: 0)]
        if showScore {
            self.titleArray.removeAtIndex(2)
            self.tableView?.deleteRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Right)
            self.showScore = false
        } else {
        self.titleArray.insert("", atIndex: 2)
        self.tableView?.insertRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Left)
        self.showScore = true
        }
        self.tableView?.endUpdates()
        
        
        
    }
    /**
    *   选择分类
    */
    func tableViewSeleteType() {
        let vc = HJPushTypeViewController()
        HJGeneralFactory.addTitleWithTitle(vc)
        let button1 = vc.view.viewWithTag(1234) as?UIButton
        let button2 = vc.view.viewWithTag(1235) as?UIButton
        button1?.setTitleColor(RGB(38, g: 82, b: 67), forState: .Normal)
        button2?.setTitleColor(RGB(38, g: 82, b: 67), forState: .Normal)
        
        vc.type = self.type
        vc.detailType = self.detailType
        vc.callBack = ({(type : String, detailType : String)->Void in
            self.type = type
            self.detailType = detailType
            self.tableView?.reloadData()
        })
        
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
    /**
    *   选择书评
    */
    func tableViewSeleteDescription() {
        let vc = HJPushDescriptionViewController()
        HJGeneralFactory.addTitleWithTitle(vc)
        vc.textView!.text = self.book_Description
        vc.callBack = ({(description : String)->Void in
            self.book_Description = description
            if self.titleArray.last == "" {
                self.titleArray.removeLast()
            }
            if description != "" {
                self.titleArray.append("")
            }
            self.tableView?.reloadData()
        })
        
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
    
    
    
    
    
}






