//
//  FocusScrollSingleView.h
//  LofterOC
//
//  Created by Elise on 16/9/9.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeFocusModel.h"

@protocol FocusScrollSingleViewDelegate;

@interface FocusScrollSingleView : UIView

@property (nonatomic,strong) HomeFocusRecomBlogsModel *model;
@property (nonatomic,assign) id <FocusScrollSingleViewDelegate> delegate;

@end

@protocol FocusScrollSingleViewDelegate <NSObject>

@required
/*!
 * @discussion 取消点击
 * @param 按钮
 * @return void
 */
- (void)FocusScrollSingleViewCancelButtonClickWith:(UIButton *)sender;
@optional
/*!
 * @discussion 关注点击
 * @param 按钮
 * @return void
 */
- (void)FocusScrollSingleViewFocusButtonClickWith:(UIButton *)sender;



@end