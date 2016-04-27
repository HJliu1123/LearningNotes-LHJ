//
//  HJImageCell.swift
//  HJCustomCollectionViewLayout
//
//  Created by liuhj on 16/4/27.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJImageCell: UICollectionViewCell {
    
    var imageView : UIImageView?
    //set和get方法
    var imageName : String? {
        didSet{
            self.imageView?.image = UIImage(named: self.imageName!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, 100, 100))
        imageView = UIImageView(frame: self.frame)
        self.contentView.addSubview(imageView!)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}
