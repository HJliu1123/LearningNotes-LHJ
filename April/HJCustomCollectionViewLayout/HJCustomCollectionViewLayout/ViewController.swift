//
//  ViewController.swift
//  HJCustomCollectionViewLayout
//
//  Created by liuhj on 16/4/27.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //懒加载
    lazy var imageNames : NSMutableArray = {
        var imageNames = NSMutableArray()
        for i in 1...9 {
            imageNames.addObject("\(i).jpg")
        }
        return imageNames
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRectMake(0, 40, self.view.frame.size.width, 200)
        
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: HJFlowLayout())
        collectionView.registerClass(HJImageCell().classForCoder, forCellWithReuseIdentifier: "Image")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        
        
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.collectionView.set
//    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Image", forIndexPath: indexPath) as? HJImageCell
        cell?.imageName = imageNames[indexPath.row] as! String
        
        return cell!
    }
    
    
    
    

}

