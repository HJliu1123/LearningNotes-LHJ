//
//  HJBookDetailView.swift
//  Xbook
//
//  Created by liuhj on 16/4/12.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJBookDetailView: UIView {
    
    var VIEW_WIDTH : CGFloat!
    var VIEW_HEIGHT : CGFloat!
    
    var Bookname : UILabel?
    var Editor : UILabel?
    var userName : UILabel?
    var date : UILabel?
    var more : UILabel?
    var score : LDXScore?
    var cover : UIImageView?
    
    //各种标签的frame有些值写死了
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.VIEW_HEIGHT = frame.size.height
        self.VIEW_WIDTH = frame.size.width
        self.cover = UIImageView(frame: CGRectMake(8, 8, (VIEW_WIDTH - 16) / 1.273, VIEW_WIDTH - 16))
        self.addSubview(self.cover!)
        
        self.Bookname = UILabel(frame: CGRectMake((VIEW_HEIGHT - 16) / 1.273 + 16, 8, VIEW_WIDTH - (VIEW_HEIGHT - 16) / 1.273 - 16, VIEW_HEIGHT / 4))
        self.Bookname?.font = UIFont(name: MY_FONT, size: 18)
        self.addSubview(self.Bookname!)
        
        self.Editor = UILabel(frame: CGRectMake((VIEW_HEIGHT - 16) / 1.273 + 16, VIEW_HEIGHT / 4, VIEW_WIDTH - (VIEW_HEIGHT - 16) / 1.273 - 16, VIEW_HEIGHT / 4))
        self.Editor?.font = UIFont(name: MY_FONT, size: 18)
        self.addSubview(self.Editor!)
        
        self.userName = UILabel(frame: CGRectMake((VIEW_HEIGHT - 16) / 1.273 + 16, VIEW_HEIGHT / 4 + VIEW_HEIGHT / 6, VIEW_WIDTH - (VIEW_HEIGHT - 16) / 1.273 - 16, VIEW_HEIGHT / 6))
        self.userName?.font = UIFont(name: MY_FONT, size: 13)
        self.userName?.textColor = RGB(35, g: 87, b: 139)
        self.addSubview(self.userName!)
        
        self.date = UILabel(frame: CGRectMake((VIEW_HEIGHT - 16) / 1.273 + 16, VIEW_HEIGHT / 4 + VIEW_HEIGHT / 6 * 2 - 8, 80, VIEW_HEIGHT / 6))
        self.date?.font = UIFont(name: MY_FONT, size: 13)
        self.date?.textColor = RGB(35, g: 87, b: 139)
        self.addSubview(self.date!)
        
        self.score = LDXScore(frame: CGRectMake((VIEW_HEIGHT - 16) / 1.273 + 16, 8 + VIEW_HEIGHT / 4 + VIEW_HEIGHT / 6 * 2, 80, VIEW_HEIGHT / 6))
        self.score?.isSelect = false
        self.score?.normalImg = UIImage(named: "btn_star_evaluation_normal")
        self.score?.highlightImg = UIImage(named: "btn_star_evaluation_press")
        self.score?.max_star = 5
        self.score?.show_star = 5
        self.addSubview(self.score!)
        
        self.more = UILabel(frame: CGRectMake((VIEW_HEIGHT - 16) / 1.273 + 16, 24 + VIEW_HEIGHT / 4 + VIEW_HEIGHT / 6 * 2, (VIEW_HEIGHT - 16) / 1.273 - 16, VIEW_HEIGHT / 6))
        self.more?.textColor = UIColor.grayColor()
        self.more?.font = UIFont(name: MY_FONT, size: 13)
        self.addSubview(self.more!)
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 0.5)
        CGContextSetRGBFillColor(context, 231/255, 231/255, 231/255, 1)
        CGContextMoveToPoint(context, 8, VIEW_HEIGHT - 2)
        CGContextAddLineToPoint(context, VIEW_WIDTH - 8, VIEW_HEIGHT - 2)
        CGContextStrokePath(context)
        
        
    }


}
