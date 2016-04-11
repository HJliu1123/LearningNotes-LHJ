//
//  HJPushBookCell.swift
//  Xbook
//
//  Created by liuhj on 16/4/11.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJPushBookCell: UITableViewCell {
    
    var bookName : UILabel?
    var editor : UILabel?
    var more : UILabel?
    
    var cover : UIImageView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        
        self.bookName = UILabel(frame: CGRectMake(78, 8, 242, 25))
        self.editor = UILabel(frame: CGRectMake(78, 33, 242, 25))
        self.more = UILabel(frame: CGRectMake(78, 66, 242, 25))
        
        self.bookName?.font = UIFont(name: MY_FONT, size: 15)
        self.editor?.font = UIFont(name: MY_FONT, size: 15)
        self.more?.font = UIFont(name: MY_FONT, size: 13)
        self.more?.textColor = UIColor.grayColor()
        
        self.contentView.addSubview(bookName!)
        self.contentView.addSubview(editor!)
        self.contentView.addSubview(more!)
        
        self.cover = UIImageView(frame: CGRectMake(8, 9, 56, 70))
        self.contentView.addSubview(cover!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
