//
//  UIViewController+Extension.m
//  LofterOC
//
//  Created by Elise on 16/8/25.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "UIViewController+Extension.h"



@implementation UIViewController (Extension)

- (void)setTabBarWithTitle:(NSString *)title withTag:(NSInteger)tag withImageStr:(NSString *)imageStr withSelectedImageStr:(NSString *)selectedImageStr {
    self.tabBarItem = [[UITabBarItem alloc] init];
    self.tabBarItem.title = title;
    self.tabBarItem.tag = tag;
    self.tabBarItem.image = [[UIImage imageNamed:imageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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


