//
//  ViewController.swift
//  imageLoop
//
//  Created by liuhj on 16/4/7.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

let kScreenW = UIScreen.mainScreen().bounds.size.width
let kScreenH = UIScreen.mainScreen().bounds.size.height

enum UIPageControlShowStyle {
    case UIPageControlShowStyleNone
    case UIPageControlShowStyleLeft
    case UIPageControlShowStyleCenter
    case UIPageControlShowStyleRight
}

enum AdTitleShowStyle {
    case AdTitleShowStyleNone
    case AdTitleShowStyleLeft
    case AdTitleShowStyleCenter
    case AdTitleShowStyleRight
}


class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView : UIScrollView?
    var currentImageIndex : NSInteger?
    var imageCount : NSInteger?
    var pageControl : UIPageControl?
    var imageNameArr : NSArray?
    var adTitleArr : NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
    }
    
    func setScrollView() ->UIScrollView {
        
        scrollView = UIScrollView(frame: CGRectMake(0, 20, kScreenW, kScreenH))
        scrollView?.bounces = false
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.pagingEnabled = true
        scrollView?.contentSize = CGSizeMake(3 * kScreenW, 0)
        scrollView?.setContentOffset(CGPointMake(kScreenW, 0), animated: false)
        scrollView?.delegate = self
        
        
        return scrollView!
    }
    
    func loadImage() {
        var leftImageIndex : NSInteger?
        var rightImageIndex : NSInteger?
        
        var offset : CGPoint = (scrollView?.contentOffset)!
        
        if offset.x == 2 * kScreenW {
            currentImageIndex = (currentImageIndex! + 1) % imageCount!
        }
        
        
        
        
        
    }
    
    
    
    
    
    

}

