//
//  TableSwitchView.m
//  LofterOC
//
//  Created by Elise on 16/9/1.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "TableSwitchView.h"




@interface TableSwitchView ()

@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong) UIView *bottomLineView;

@property (nonatomic,strong) UIButton *selectedButton;

@end

@implementation TableSwitchView

#pragma mark - lifecycle

- (instancetype)initWithLeftText:(NSString *)leftText withRightText:(NSString *)rightText {
    self = [super init];
    if (self) {
        self.leftButton = [[UIButton alloc] init];
        self.rightButton = [[UIButton alloc] init];
        [self setButtonWith:self.leftButton title:leftText tag:1];
        [self setButtonWith:self.rightButton title:rightText tag:2];
        [self setBottom];
        [self buttonClick:self.leftButton];
        
    }
    return self;
}

#pragma mark - override
- (void)layoutSubviews {
    [super layoutSubviews];
    self.leftButton.frame = CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height);
    self.rightButton.frame = CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width / 2, self.frame.size.height);
    self.bottomLineView.frame = CGRectMake(0, self.frame.size.height - 2, self.frame.size.width / 2, 2);
}

#pragma mark - private

- (void)setButtonWith:(UIButton *)button title:(NSString *)title tag:(NSInteger)tag {
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    button.highlighted = false;
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:button];
}

- (void)setBottom {
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = [UIColor colorWithRed:155/255.0 green:196/255.0 blue:38/255.0 alpha:1.0];
    [self addSubview:self.bottomLineView];
}

- (void)buttonClick:(UIButton *)sender {
    if (self.selectedButton) {
        self.selectedButton.selected = false;
    }
    sender.selected = true;
    self.selectedButton = sender;
    [self bottomViewAnimationWithIndex:(CGFloat)(self.selectedButton.tag - 1)];
    [self.delegate tableSwitchView:self didSelectedButton:self.selectedButton forIndex:(self.selectedButton.tag - 1)];
}

- (void)bottomViewAnimationWithIndex:(CGFloat)index {
    [UIView animateWithDuration:0.2 animations:^{
        CGRect bottomFrame = self.bottomLineView.frame;
        bottomFrame.origin.x = index * (self.frame.size.width / 2);
        self.bottomLineView.frame = bottomFrame;
    }];
}

- (void)clickButtonWithIndex:(NSInteger)index {
    UIButton *clickButton = (UIButton *)[self viewWithTag:(index + 1)];
    [self buttonClick:clickButton];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
