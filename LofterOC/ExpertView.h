//
//  ExpertView.h
//  LofterOC
//
//  Created by Elise on 16/9/2.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DescoverExpertModel.h"
#import "SingleExpertView.h"

@protocol ExpertViewDelegate;

@interface ExpertView : UIView

@property (nonatomic,strong) DescoverExpertModels *model;
@property (nonatomic,assign) id <ExpertViewDelegate> delegate;

+ (ExpertView *)loadExpertViewWithModel:(DescoverExpertModels *)model;

@end

@protocol ExpertViewDelegate <NSObject>

@required

- (void)expertViewMoreFunButtonClick:(UIButton *)sender;

- (void)expertViewSingleExpertClick:(SingleExpertView *)tapView;

- (void)expertViewMoreExpertButtonClick:(UIButton *)sender;

@end