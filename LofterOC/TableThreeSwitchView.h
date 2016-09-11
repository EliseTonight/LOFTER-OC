//
//  TableThreeSwitchView.h
//  LofterOC
//
//  Created by Elise on 16/9/4.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  TableThreeSwitchViewDelegate;

@interface TableThreeSwitchView : UIView

@property (nonatomic,assign) id <TableThreeSwitchViewDelegate> delegate;

- (instancetype)initWithLeftText:(NSString *)leftText withMidText:(NSString *)midText withRightText:(NSString *)rightText;

@end

@protocol TableThreeSwitchViewDelegate <NSObject>

@required

- (void)tableThreeSwitchViewDelegate:(TableThreeSwitchView *)tableThreeSwitchView didSelectedButton:(UIButton *)button forIndex:(NSInteger)index;

@end
