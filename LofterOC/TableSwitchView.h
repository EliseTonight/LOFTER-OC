//
//  TableSwitchView.h
//  LofterOC
//
//  Created by Elise on 16/9/1.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  TabelSwitchViewDelegate;

@interface TableSwitchView : UIView

@property (nonatomic,assign) id <TabelSwitchViewDelegate> delegate;

- (instancetype)initWithLeftText:(NSString *)leftText withRightText:(NSString *)rightText;

- (void)clickButtonWithIndex:(NSInteger)index;

@end

@protocol TabelSwitchViewDelegate <NSObject>

@required

- (void)tableSwitchView:(TableSwitchView *)tableSwitchView didSelectedButton:(UIButton *)button forIndex:(NSInteger)index;

@optional


@end