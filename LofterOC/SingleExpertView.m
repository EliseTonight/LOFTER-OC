//
//  SingleExpertView.m
//  LofterOC
//
//  Created by Elise on 16/9/2.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "SingleExpertView.h"
#import "UIImageView+WebCache.h"
#import "CornerImageView.h"

@interface SingleExpertView ()

@property (nonatomic,strong) UIView *mainContentView;
@property (nonatomic,strong) CornerImageView *iconView;
@property (nonatomic,strong) UILabel *nickNameLabel;
@property (nonatomic,strong) UILabel *tipLabel;

@end

@implementation SingleExpertView

#pragma mark - lifecycle

- (instancetype)initWithFrame:(CGRect)frame withModel:(DescoverExpertModel *)model {
    self = [super initWithFrame:frame];
    if (self) {
        self.model = model;
        [self setViews];
    }
    return self;
}

#pragma mark - private

- (void)setViews {
    
    self.mainContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.mainContentView.backgroundColor = [UIColor whiteColor];
    
    self.iconView = [[CornerImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - 80) * 0.5, 0, 80, 80) withCornerRadius:40 withBorderWidth:0 withBorderColor:nil];
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.model.blogInfo.bigAvaImg]];
    [self.mainContentView addSubview:self.iconView];
    
    self.nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 80, self.mainContentView.frame.size.width - 16, 20)];
    self.nickNameLabel.font = [UIFont systemFontOfSize:14];
    self.nickNameLabel.text = self.model.blogInfo.blogNickName;
    self.nickNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.mainContentView addSubview:self.nickNameLabel];
    
    self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 100, self.mainContentView.frame.size.width - 16, 20)];
    self.tipLabel.font = [UIFont systemFontOfSize:12];
    self.tipLabel.text = self.model.tip;
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.mainContentView addSubview:self.tipLabel];
    
    [self addSubview:self.mainContentView];
    
}

#pragma mark - class func 

+ (SingleExpertView *)loadSingleExpertViewWithModel:(DescoverExpertModel *)model withFrame:(CGRect)rect {
    SingleExpertView *returnView = [[SingleExpertView alloc] initWithFrame:rect withModel:model];
    return returnView;
}


@end
