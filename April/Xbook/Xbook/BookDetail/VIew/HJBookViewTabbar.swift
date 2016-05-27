//
//  HJBookViewTabbar.swift
//  Xbook
//
//  Created by liuhj on 16/4/12.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

protocol HJBookViewTabbarDelegate {
    
    func comment()
    func commentController()
    func likeBook(button : UIButton)
    func shareAction()
    
}


class HJBookViewTabbar: UIView {

    
    var delegate : HJBookViewTabbarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        let imageName = ["Pen 4", "chat 3", "heart", "box outgoing"]
        for i in 0 ..< 4 {
            let button = UIButton(frame: CGRectMake(CGFloat(i)*frame.size.width/4, 0, frame.size.width/4, frame.size.height))
            button.setImage(UIImage(named: imageName[i]), forState: .Normal)
            self.addSubview(button)
            button.tag = i
            button.addTarget(self, action: #selector(HJBookViewTabbar.BookTabbarAction(_:)), forControlEvents: .TouchUpInside)
        }
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 0.5)
        CGContextSetRGBFillColor(context, 231/255, 231/255, 231/255, 1.0)
        for i in 0 ..< 4 {
            CGContextMoveToPoint(context, CGFloat(i)*rect.size.width/4, rect.size.height*0.1)
            CGContextAddLineToPoint(context, CGFloat(i)*rect.size.width/4, CGFloat(i)*rect.size.height*0.9)
        }
        CGContextMoveToPoint(context, 8, 0)
        CGContextAddLineToPoint(context, rect.size.width - 8, 0)
        CGContextStrokePath(context)
        
    }
    
    
    
    func BookTabbarAction(button : UIButton) {
        
        switch(button.tag) {
            
        case 0:
            delegate?.comment()
            break
        case 1:
            delegate?.commentController()
            break
        case 2:
            delegate?.likeBook(button)
            break
        case 3:
            delegate?.shareAction()
        default :
            break
        }
        
        
    }

}
