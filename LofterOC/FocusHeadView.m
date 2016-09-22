//
//  FocusHeadView.m
//  LofterOC
//
//  Created by Elise on 16/9/22.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "FocusHeadView.h"
#import "UIImageView+WebCache.h"

@interface FocusHeadView ()

@property (nonatomic,strong) UIImageView *mainImageView;

@end

@implementation FocusHeadView

#pragma mark - lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
        [self addObserver:self forKeyPath:@"model" options:NSKeyValueObservingOptionNew context:FocusHeadViewContextKVO];
    }
    return self;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == FocusHeadViewContextKVO) {
        HomeFocusHeadModel *newModel = (HomeFocusHeadModel *)[change valueForKey:FocusHeadViewContextKVO];
        [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:newModel.img]];
    }
}

#pragma mark - private 

- (void)setUpViews {
    self.mainImageView = [[UIImageView alloc] initWithFrame:self.frame];
    [self addSubview:self.mainImageView];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
