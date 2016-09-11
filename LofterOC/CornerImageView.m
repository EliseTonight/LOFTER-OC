//
//  CornerImageView.m
//  LofterOC
//
//  Created by Elise on 16/9/3.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "CornerImageView.h"

@implementation CornerImageView

#pragma mark - lifecycel

- (instancetype)initWithFrame:(CGRect)frame withCornerRadius:(CGFloat)cornerRadius withBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor *)color {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = cornerRadius > 0;
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = borderWidth;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
