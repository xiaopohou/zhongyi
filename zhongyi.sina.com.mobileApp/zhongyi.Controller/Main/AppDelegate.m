//
//  AppDelegate.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/28.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "AppDelegate.h"
#import "LZMainTabBarViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    LZMainTabBarViewController *mainTabView=[[LZMainTabBarViewController alloc]init];

    self.window.rootViewController=mainTabView;
    
    [UITabBar appearance].tintColor = [UIColor colorWithRed:22.0/255.0 green:147.0/255.0 blue:114.0/255.0 alpha:1.0];
    
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
