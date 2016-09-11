//
//  AutoScrollView.h
//  LofterOC
//
//  Created by Elise on 16/8/26.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DescoverScrollImageModel.h"


@protocol AutoScrollViewDelegate;


@interface AutoScrollView : UIView

@property (nonatomic,assign) id <AutoScrollViewDelegate> delegate;
//设置这个model之后开始自动加载,,kvo
@property (nonatomic,strong) DescoverScrollImageModels *model;


//有关pageController
- (void)showPageController;
- (void)hiddenPageController;

//获取currentindex

- (NSInteger)getCurrentIndex;

///开始自动滚动
- (void)startTimer;
///关闭自动滚动
- (void)endTimer;

//加载autoscrollview

@end


//代理
@protocol AutoScrollViewDelegate <NSObject>

@required
/*!
 * @discussion 点击滚动图片后进入
 * @param   autoScrollView    主体
 * @param   index             点击的位置
 * @return nil
 */
- (void)autoScrollViewView:(AutoScrollView *)autoScrollView didSelectedAtIndex:(NSInteger)index;

@optional

- (void)autoScrollViewImageDidChange:(NSInteger)currentIndex;



@end