//
//  SingleExpertView.h
//  LofterOC
//
//  Created by Elise on 16/9/2.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DescoverExpertModel.h"



@interface SingleExpertView : UIView

@property (nonatomic,strong) DescoverExpertModel *model;

+ (SingleExpertView *)loadSingleExpertViewWithModel:(DescoverExpertModel *)model withFrame:(CGRect)rect;

@end
