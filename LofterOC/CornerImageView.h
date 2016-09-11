//
//  CornerImageView.h
//  LofterOC
//
//  Created by Elise on 16/9/3.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CornerImageView : UIImageView

- (instancetype)initWithFrame:(CGRect)frame withCornerRadius:(CGFloat)cornerRadius withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)color;

@end
