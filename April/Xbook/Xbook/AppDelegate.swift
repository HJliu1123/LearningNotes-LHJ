//
//  AppDelegate.swift
//  Xbook
//
//  Created by liuhj on 16/1/19.
//  Copyright © 2016年 liuhj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        
        
        
        
        
        
        AVOSCloud.setApplicationId("AmK5ueFiWWSCYr5Fyv3clqnL-gzGzoHsz", clientKey: "RwtFfpvtsSy7Uxsl95Sx5vCz")
        
//        @"AmK5ueFiWWSCYr5Fyv3clqnL-gzGzoHsz"
//        @"clientKey:@"RwtFfpvtsSy7Uxsl95Sx5vCz"
        
//        集成分享
        ShareSDK.registerApp("11e97eb26807d", activePlatforms: [SSDKPlatformType.TypeSinaWeibo.rawValue, SSDKPlatformType.TypeWechat.rawValue, SSDKPlatformType.TypeQQ.rawValue, SSDKPlatformType.TypeTencentWeibo.rawValue], onImport: { (platform : SSDKPlatformType) in
            switch platform {
                
            case SSDKPlatformType.TypeWechat:
                ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                break
            case SSDKPlatformType.TypeQQ:
                ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                break
                
            default :
                break
            }
        }) { (platform : SSDKPlatformType, appinfo : NSMutableDictionary!) in
            
            switch platform {
                
            case SSDKPlatformType.TypeSinaWeibo:
                appinfo.SSDKSetupSinaWeiboByAppKey("3354611248", appSecret: "a9704e40f278edf4b7d22edb671bcc8e", redirectUri: "http://www.sharesdk.cn", authType: SSDKAuthTypeBoth)
                break
            
                
            default :
                break
                
            }
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        self.window = UIWindow(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HIGHT))
        
        let tabbarController = UITabBarController()
        
        let rankController = UINavigationController(rootViewController: HJRankViewController())
        let searchController = UINavigationController(rootViewController: HJSearchViewController())
        let pushController = UINavigationController(rootViewController: HJPushViewController())
        let moreController = UINavigationController(rootViewController: HJMoreViewController())
        let circleController = UINavigationController(rootViewController: HJCircleViewController())

        tabbarController.viewControllers = [rankController, searchController, pushController, circleController, moreController]
        
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
        
        self.window?.rootViewController = tabbarController
        
        self.window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

