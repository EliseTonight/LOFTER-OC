//
//  ExpertView.m
//  LofterOC
//
//  Created by Elise on 16/9/2.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "ExpertView.h"



//这个view包含 从 “更多好玩的标签” 至 “查看更多达人”

@interface ExpertView ()

@property (nonatomic,strong) UIView *mainView;
@property (nonatomic,strong) UIButton *moreFunButton;
@property (nonatomic,strong) UIView *grayView;
@property (nonatomic,strong) UILabel *expertRecommendLabel;
@property (nonatomic,strong) UIView *grayLineView;
@property (nonatomic,strong) UIButton *moreExpertButton;

@end

@implementation ExpertView

#pragma mark - lifecycle

- (instancetype)initWithModel:(DescoverExpertModels *)model {
    self = [super initWithFrame:CGRectMake(0, 0, AppWidth, 421)];
    if (self) {
        self.model = model;
        [self setViews];
    }
    return self;
}

#pragma mark - private

- (void)setViews {
    self.mainView = [[UIView alloc] initWithFrame:self.frame];
    self.mainView.backgroundColor = [UIColor whiteColor];
    
    self.moreFunButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    [self.moreFunButton setTitle:@"更多好玩的标签" forState:UIControlStateNormal];
    [self.moreFunButton setImage:[UIImage imageNamed:@"列表页面_进入"] forState:UIControlStateNormal];
    self.moreFunButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.moreFunButton setTitleColor:[UIColor colorWithRed:155/255.0 green:196/255.0 blue:38/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.moreFunButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.moreFunButton.imageView.frame.size.width, 0, self.moreFunButton.imageView.frame.size.width)];
    [self.moreFunButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.moreFunButton.titleLabel.frame.size.width, 0, -self.moreFunButton.titleLabel.frame.size.width)];
    [self.moreFunButton addTarget:self action:@selector(funButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView addSubview:self.moreFunButton];
    
    self.grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, 20)];
    self.grayView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.mainView addSubview:self.grayView];
    
    self.expertRecommendLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 70, self.frame.size.width - 16, 40)];
    self.expertRecommendLabel.text = @"达人推荐";
    self.expertRecommendLabel.textColor = [UIColor lightGrayColor];
    self.expertRecommendLabel.textAlignment = NSTextAlignmentLeft;
    self.expertRecommendLabel.font = [UIFont systemFontOfSize:13];
    [self.mainView addSubview:self.expertRecommendLabel];
    
    //生成单个的达人
    for (int i = 0;i <= 5;i++) {
        DescoverExpertModel *singleModel = self.model.item[i];
        CGRect singleFrame;
        if (i <= 2) {
            singleFrame = CGRectMake(i * self.frame.size.width / 3, 110, self.frame.size.width / 3, 120);
        }
        else {
            singleFrame = CGRectMake((i - 3) * self.frame.size.width / 3, 240, self.frame.size.width / 3, 120);
        }
        SingleExpertView *singleView = [SingleExpertView loadSingleExpertViewWithModel:singleModel withFrame:singleFrame];
        singleView.tag = 1000 + i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleViewClick:)];
        singleView.userInteractionEnabled = true;
        [singleView addGestureRecognizer:tap];
        [self.mainView addSubview:singleView];
    }
    
    self.grayLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 370, self.frame.size.width, 0.5)];
    self.grayLineView.backgroundColor = [UIColor lightGrayColor];
    [self.mainView addSubview:self.grayLineView];
    
    self.moreExpertButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 371, self.frame.size.width, 50)];
    [self.moreExpertButton setTitle:@"查看更多达人" forState:UIControlStateNormal];
    [self.moreExpertButton setImage:[UIImage imageNamed:@"列表页面_进入"] forState:UIControlStateNormal];
    self.moreExpertButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.moreExpertButton setTitleColor:[UIColor colorWithRed:155/255.0 green:196/255.0 blue:38/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.moreExpertButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.moreExpertButton.imageView.frame.size.width, 0, self.moreExpertButton.imageView.frame.size.width)];
    [self.moreExpertButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.moreExpertButton.titleLabel.frame.size.width, 0, -self.moreExpertButton.titleLabel.frame.size.width)];
    [self.moreExpertButton addTarget:self action:@selector(expertButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView addSubview:self.moreExpertButton];

    [self addSubview:self.mainView];
}

#pragma mark - action

- (void)singleViewClick:(UITapGestureRecognizer *)tap {
    SingleExpertView *singleView = (SingleExpertView *)tap.view;
    [self.delegate expertViewSingleExpertClick:singleView];
    
}

- (void)funButtonClick:(UIButton *)sender {
    [self.delegate expertViewMoreFunButtonClick:sender];
}

- (void)expertButtonClick:(UIButton *)sender {
    [self.delegate expertViewMoreExpertButtonClick:sender];
}

#pragma mark - class func

+ (ExpertView *)loadExpertViewWithModel:(DescoverExpertModels *)model {
    ExpertView *view = [[ExpertView alloc] initWithModel:model];
    return view;
}

@end
