//
//  UIViewController+Extension.h
//  LofterOC
//
//  Created by Elise on 16/8/25.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

- (void)setTabBarWithTitle:(NSString *)title withTag:(NSInteger)tag withImageStr:(NSString *)imageStr withSelectedImageStr:(NSString *)selectedImageStr;

- (UIImage *)imageWithPureColor:(UIColor *)color;

@end
