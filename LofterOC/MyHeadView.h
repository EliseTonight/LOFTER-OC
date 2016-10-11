//
//  MyHeadView.h
//  LofterOC
//
//  Created by Elise on 16/10/6.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>




@protocol MyHeadViewDelegate;

@interface MyHeadView : UIView

@property (nonatomic,weak) id<MyHeadViewDelegate> delegate;

+ (MyHeadView *)loadMyHeadViewFromXibWithFrame:(CGRect)frame;

@end

@protocol MyHeadViewDelegate <NSObject>

@optional

- (void)headWelfareViewClick;
- (void)headLofterViewClick;
- (void)headPhotoViewClick;
- (void)headShareViewClick;
- (void)headSetViewClick;

@end
