//
//  AppDelegate.m
//  DentistAssist
//
//  Created by NillCui on 15/5/18.
//  Copyright (c) 2015年 NillCui. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //a.初始化一个tabBar控制器
    UITabBarController *tb = [[UITabBarController alloc] init];
    //设置控制器为Window的根控制器
    self.window.rootViewController = tb;
    
    //b.创建子控制器
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *c1 = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeVC.view.backgroundColor = [UIColor grayColor];
    c1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主页"
                                                     image:[UIImage imageNamed:@"tab1_nor.png"]
                                             selectedImage:[UIImage imageNamed:@"tab1_press.png"]];
    c1.tabBarItem.badgeValue = @"123";
    
    
    UIViewController *msgVC = [[UIViewController alloc] init];
    UINavigationController *c2 = [[UINavigationController alloc] initWithRootViewController:msgVC];
    msgVC.view.backgroundColor=[UIColor brownColor];
    c2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息"
                                                  image:[UIImage imageNamed:@"tab2_nor.png"]
                                          selectedImage:[UIImage imageNamed:@"tab2_press.png"]];
    
    
    UIViewController *dynaVC = [[UIViewController alloc] init];
    UINavigationController *c3 = [[UINavigationController alloc] initWithRootViewController:dynaVC];
    dynaVC.view.backgroundColor=[UIColor blueColor];
    c3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"动态"
                                                  image:[UIImage imageNamed:@"tab3_nor.png"]
                                          selectedImage:[UIImage imageNamed:@"tab3_press.png"]];
    
    UIViewController *myVC = [[UIViewController alloc] init];
    UINavigationController *c4 = [[UINavigationController alloc] initWithRootViewController:myVC];
    myVC.view.backgroundColor=[UIColor greenColor];
    c4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人"
                                                  image:[UIImage imageNamed:@"tab4_nor.png"]
                                          selectedImage:[UIImage imageNamed:@"tab4_press.png"]];
    
    //c.添加子控制器到ITabBarController中
    //c.1第一种方式
    //    [tb addChildViewController:c1];
    //    [tb addChildViewController:c2];
    
    //c.2第二种方式
    tb.viewControllers=@[c1,c2,c3,c4];
    
    //2.设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
