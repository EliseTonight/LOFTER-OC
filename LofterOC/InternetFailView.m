//
//  InternetFailView.m
//  LofterOC
//
//  Created by Elise on 16/9/12.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "InternetFailView.h"

@implementation InternetFailView


#pragma mark - lifeCycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark - public

+ (UIView *)loadInternetFailViewWithXib {
    UIView *returnView = (UIView *)[[NSBundle mainBundle] loadNibNamed:@"InternetFailView" owner:nil options:nil].lastObject;
    return returnView;
}

@end
