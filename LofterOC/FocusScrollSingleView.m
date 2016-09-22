//
//  FocusScrollSingleView.m
//  LofterOC
//
//  Created by Elise on 16/9/9.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "FocusScrollSingleView.h"
#import "UIImageView+WebCache.h"
#import "CornerImageView.h"

@interface FocusScrollSingleView ()

@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) CornerImageView *iconImageView;
@property (nonatomic,strong) UILabel *nickNameLabel;
@property (nonatomic,strong) UILabel *likeNumberLabel;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *midImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic,strong) UIButton *focusButton;

@end

@implementation FocusScrollSingleView

#pragma mark - lifeCycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
        [self addObserver:self forKeyPath:@"model" options:NSKeyValueObservingOptionNew context:FocusScrollSingleViewContextKVO];
    }
    return self;
}

#pragma mark - priavte

- (void)setUpViews {
    CGRect selfFrame = self.frame;
    
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(8, selfFrame.size.width - 15 - 8, 15, 15)];
    [self.cancelButton setBackgroundImage:[UIImage imageNamed:@"叉"] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelButton];
    
    self.iconImageView = [[CornerImageView alloc] initWithFrame:CGRectMake(selfFrame.size.width / 2 - 30, 15, 60, 60) withCornerRadius:30 withBorderWidth:0 withBorderColor:nil];
    [self addSubview:self.iconImageView];
    
    self.nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, CGRectGetMaxY(self.iconImageView.frame) + 8, selfFrame.size.width - 16, 22)];
    self.nickNameLabel.font = [UIFont systemFontOfSize:15];
    self.nickNameLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    self.nickNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.nickNameLabel];
    
    self.likeNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, CGRectGetMaxY(self.nickNameLabel.frame), selfFrame.size.width - 16, 18)];
    self.likeNumberLabel.font = [UIFont systemFontOfSize:11];
    self.likeNumberLabel.textColor = [UIColor lightGrayColor];
    self.likeNumberLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.likeNumberLabel];
    
    self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15 + CGRectGetMaxY(self.likeNumberLabel.frame) + 15, (selfFrame.size.width - 2 / 3.0) ,  (selfFrame.size.width - 2 / 3.0) )];
    self.midImageView = [[UIImageView alloc] initWithFrame:CGRectMake((selfFrame.size.width - 2 / 3.0)  + 1, CGRectGetMaxY(self.likeNumberLabel.frame) + 15, (selfFrame.size.width - 2 / 3.0) , (selfFrame.size.width - 2 / 3.0) )];
    self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake((selfFrame.size.width - 2 / 3.0) * 2 + 2, CGRectGetMaxY(self.likeNumberLabel.frame) + 15, (selfFrame.size.width - 2 / 3.0), (selfFrame.size.width - 2 / 3.0))];
    [self addSubview:self.leftImageView];
    [self addSubview:self.midImageView];
    [self addSubview:self.rightImageView];
    
    self.focusButton = [[UIButton alloc] initWithFrame:CGRectMake(selfFrame.size.width / 2 - 38, CGRectGetMaxY(self.midImageView.frame) + ((selfFrame.size.height - CGRectGetMaxY(self.midImageView.frame)) / 4), 76, (selfFrame.size.height - CGRectGetMaxY(self.midImageView.frame)) / 2)];
    [self.focusButton setBackgroundImage:[UIImage imageNamed:@"感兴趣的人卡片里的关注按钮"] forState:UIControlStateNormal];
    [self.focusButton setBackgroundImage:[UIImage imageNamed:@"感兴趣的人已关注"] forState:UIControlStateSelected];
    [self.focusButton addTarget:self action:@selector(focusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.focusButton];
}

#pragma mark - action

- (void)cancelButtonClick:(UIButton *)sender {
    [self.delegate FocusScrollSingleViewCancelButtonClickWith:sender];
}

- (void)focusButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(FocusScrollSingleViewFocusButtonClickWith:)]) {
        [self.delegate FocusScrollSingleViewFocusButtonClickWith:sender];
    }
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == FocusScrollSingleViewContextKVO) {
        HomeFocusRecomBlogsModel *newModel = (HomeFocusRecomBlogsModel*)[change objectForKey:NSKeyValueChangeNewKey];
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:newModel.blogInfo.bigAvaImg]];
        self.nickNameLabel.text = newModel.blogInfo.blogNickName;
        self.likeNumberLabel.text = [NSString stringWithFormat:@"被喜欢%ld次",(long)newModel.likedCount];
        NSString *rightImageString = ((HomeFocusRecomBlogsPostsModel *)newModel.posts[2]).image;
        NSString *midImageString = ((HomeFocusRecomBlogsPostsModel *)newModel.posts[1]).image;
        NSString *leftImageString = ((HomeFocusRecomBlogsPostsModel *)newModel.posts[0]).image;
        [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:rightImageString]];
        [self.midImageView sd_setImageWithURL:[NSURL URLWithString:midImageString]];
        [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:rightImageString]];
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
