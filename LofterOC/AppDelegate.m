//
//  AppDelegate.m
//  LofterOC
//
//  Created by Elise on 16/8/23.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setAppAppearance];
    MainTabBarViewController *mainView = [[MainTabBarViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:MainBounds];
    self.window.rootViewController = mainView;
    [self.window makeKeyAndVisible];
    
    
    
    
    
    
    
    // Override point for customization after application launch.
    return YES;
}

#pragma mark - private

//设置公共外观
- (void)setAppAppearance {

    //设置公共的tabbar text的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:97/255.0 blue:98/255.0 alpha:1.0],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:132/255.0 green:160/255.0 blue:161/255.0 alpha:1.0],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    [[UITabBar appearance] setShadowImage:[self imageWithPureColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1]]];
    [[UITabBar appearance] setBackgroundImage:[self imageWithPureColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1]]];
}

//获取第一个view
- (UIViewController *)getMainView {
    MainTabBarViewController *mainView = [[MainTabBarViewController alloc] init];
    return mainView;
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
- (UIImage *)imageWithPureColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  image;
}

@end
