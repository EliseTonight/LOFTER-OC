//
//  MyHeadView.m
//  LofterOC
//
//  Created by Elise on 16/10/6.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "MyHeadView.h"


@interface MyHeadView ()

@property (weak, nonatomic) IBOutlet UIView *welfareView;
@property (weak, nonatomic) IBOutlet UIView *lofterView;
@property (weak, nonatomic) IBOutlet UIView *photoView;
@property (weak, nonatomic) IBOutlet UIView *shareView;
@property (weak, nonatomic) IBOutlet UIView *setView;
@property (nonatomic,assign) CGFloat topViewOriginHeight;

@end

@implementation MyHeadView

#pragma mark - lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setAllClickEvents];
    self.topViewOriginHeight = 180;
}

#pragma mark - public

+ (MyHeadView *)loadMyHeadViewFromXibWithFrame:(CGRect)frame {
    MyHeadView *view = (MyHeadView *)[[NSBundle mainBundle] loadNibNamed:@"MyHeadView" owner:nil options:nil].lastObject;
    view.frame = frame;
    return view;
}

#pragma mark - privtae

- (void)setAllClickEvents {
    
    UIGestureRecognizer *welfareRecongnizer = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(welfareViewClick)];
    self.welfareView.userInteractionEnabled = true;
    [self.welfareView addGestureRecognizer:welfareRecongnizer];
    
    UIGestureRecognizer *lofterRecongnizer = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(lofterViewClick)];
    self.lofterView.userInteractionEnabled = true;
    [self.lofterView addGestureRecognizer:lofterRecongnizer];
    
    UIGestureRecognizer *photoRecongnizer = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(photoViewClick)];
    self.photoView.userInteractionEnabled = true;
    [self.photoView addGestureRecognizer:photoRecongnizer];

    UIGestureRecognizer *shareRecongnizer = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(shareViewClick)];
    self.shareView.userInteractionEnabled = true;
    [self.shareView addGestureRecognizer:shareRecongnizer];

    UIGestureRecognizer *setRecongnizer = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(setViewClick)];
    self.setView.userInteractionEnabled = true;
    [self.setView addGestureRecognizer:setRecongnizer];
    
}

#pragma mark - action

- (void)welfareViewClick {
    if ([self.delegate respondsToSelector:@selector(headWelfareViewClick)]) {
        [self.delegate headWelfareViewClick];
    }
}

- (void)lofterViewClick {
    if ([self.delegate respondsToSelector:@selector(headLofterViewClick)]) {
        [self.delegate headLofterViewClick];
    }
}

- (void)photoViewClick {
    if ([self.delegate respondsToSelector:@selector(headPhotoViewClick)]) {
        [self.delegate headPhotoViewClick];
    }
}

- (void)shareViewClick {
    if ([self.delegate respondsToSelector:@selector(headShareViewClick)]) {
        [self.delegate headShareViewClick];
    }
}

- (void)setViewClick {
    if ([self.delegate respondsToSelector:@selector(headSetViewClick)]) {
        [self.delegate headSetViewClick];
    }
}












/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
