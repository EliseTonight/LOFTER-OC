//
//  LofterRefreshHeader.m
//  LofterOC
//
//  Created by Elise on 16/8/29.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "LofterRefreshHeader.h"

@implementation LofterRefreshHeader



//自定义刷新控件

- (void)prepare {
    [super prepare];
    self.stateLabel.hidden = true;
    self.lastUpdatedTimeLabel.hidden = true;
    
    //闲置状态
    NSMutableArray *staticImages = [[NSMutableArray alloc] init];
    UIImage *staticImage = [UIImage imageNamed:@"loading001"];
    [staticImages addObject:staticImage];
    [self setImages:staticImages forState:MJRefreshStateIdle];
    
    //松开即可刷新的状态
    NSMutableArray *readyRefreshImages = [[NSMutableArray alloc] init];
    UIImage *readyRefreshImage = [UIImage imageNamed:@"loading001"];
    [readyRefreshImages addObject:readyRefreshImage];
    [self setImages:readyRefreshImages forState:MJRefreshStatePulling];
    
    //刷新的状态
    NSMutableArray *refreshImages = [[NSMutableArray alloc] init];
    for (int i = 1;i <= 45;i++) {
        UIImage *refreshImage = [UIImage imageNamed:[NSString stringWithFormat:@"loading%03d",i]];
        [refreshImages addObject:refreshImage];
    }
    [self setImages:refreshImages forState:MJRefreshStateRefreshing];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
