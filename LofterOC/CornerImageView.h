//
//  CornerImageView.h
//  LofterOC
//
//  Created by Elise on 16/9/3.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface CornerImageView : UIImageView

@property (nonatomic,assign) IBInspectable CGFloat borderWidth;
@property (nonatomic,strong) IBInspectable UIColor *borderColor;
@property (nonatomic,assign) IBInspectable CGFloat cornerRadius;


- (instancetype)initWithFrame:(CGRect)frame withCornerRadius:(CGFloat)cornerRadius withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)color;

@end
