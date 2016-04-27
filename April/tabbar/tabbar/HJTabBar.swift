//
//  HJTabBar.swift
//  tabbar
//
//  Created by liuhj on 16/4/25.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

protocol HJTabBarDelegate {
    
    func clickButton(tabBar : HJTabBar)
    
    
    
}



class HJTabBar: UITabBar {

    var tabBarDelegate : HJTabBarDelegate?
    
    
    
    
    
    
    
    

}
