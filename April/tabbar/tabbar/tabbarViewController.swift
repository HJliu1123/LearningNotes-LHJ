//
//  tabbarViewController.swift
//  tabbar
//
//  Created by liuhj on 16/4/25.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class tabbarViewController: UITabBarController, UITabBarControllerDelegate, HJTabBarDelegate {
    
    var lastSelectVC : UIViewController?
    
    var firstVC : firstViewController?
    
    var secondVC : sceondViewController?
    
    var thirdVC : thirdViewController?
    
    var fouthVC : fouthViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.delegate = self
        
//        self.tabBar.hidden = true
        
        self.addCustomTabBar()
        
        self.addAllChildVCs()
        
        
        
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        let vc = viewController.childViewControllers.first
        if (vc?.isKindOfClass(firstViewController.classForCoder()) != nil) {
            if self.lastSelectVC == vc {
                firstVC!.refresh(true)
            } else {
                firstVC!.refresh(false)
            }
        }
        lastSelectVC = vc
    }
    
    func addCustomTabBar() {
        
        let customTabBar = HJTabBar()
        customTabBar.tabBarDelegate = self
        //tabbar是只读的属性，不能直接赋值
        self.setValue(customTabBar, forKey: "tabBar")
        
        
    }
    
    
    func addAllChildVCs() {
        
        firstVC = firstViewController()
        self.addChildViewController(firstVC!, title: "第一个", imageName: "", selectImageName: "")
        lastSelectVC = firstVC
        
        secondVC = sceondViewController()
        self.addChildViewController(secondVC!, title: "第二个", imageName: "", selectImageName: "")
        
        thirdVC = thirdViewController()
        self.addChildViewController(thirdVC!, title: "第三个", imageName: "", selectImageName: "")
        
        fouthVC = fouthViewController()
        self.addChildViewController(fouthVC!, title: "第四个", imageName: "", selectImageName: "")
        
    }
    
    
    func addChildViewController(childController : UIViewController, title : String, imageName : String, selectImageName : String) {
        
        childController.title = title
        childController.view.backgroundColor = UIColor.lightGrayColor()
        childController.tabBarItem.title = title
        
        let navi = UINavigationController(rootViewController: childController)
        self.addChildViewController(navi)
        
    }
    
    
    
    func clickButton(tabBar: HJTabBar) {
        
        
        
        
        
        
    }
    
    
    
    

}
