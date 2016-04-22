//
//  HJTabbarController.swift
//  Xbook
//
//  Created by liuhj on 16/4/21.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

class HJTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rankController = UINavigationController(rootViewController: HJRankViewController())
        let searchController = UINavigationController(rootViewController: HJSearchViewController())
        let pushController = UINavigationController(rootViewController: HJPushViewController())
        let moreController = UINavigationController(rootViewController: HJMoreViewController())
        let circleController = UINavigationController(rootViewController: HJCircleViewController())
        
        self.viewControllers = [rankController, searchController, pushController, circleController, moreController]
        
        let tabbarItem1 = UITabBarItem(title: "排行榜", image: UIImage(named: "bio"), selectedImage: UIImage(named: "bio_red"))
        let tabbarItem2 = UITabBarItem(title: "发现", image: UIImage(named: "timer 2"), selectedImage: UIImage(named: "timer 2_red"))
        let tabbarItem3 = UITabBarItem(title: "", image: UIImage(named: "pencil"), selectedImage: UIImage(named: "pencil_red"))
        let tabbarItem4 = UITabBarItem(title: "圈子", image: UIImage(named: "users two-2"), selectedImage: UIImage(named: "users two-2_red"))
        let tabbarItem5 = UITabBarItem(title: "更多", image: UIImage(named: "more"), selectedImage: UIImage(named: "more_red"))
        
        rankController.tabBarItem = tabbarItem1
        searchController.tabBarItem = tabbarItem2
        pushController.tabBarItem = tabbarItem3
        circleController.tabBarItem = tabbarItem4
        moreController.tabBarItem = tabbarItem5
        
        rankController.tabBarController?.tabBar.tintColor = MAIN_RED
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
