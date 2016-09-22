//
//  FocusSingleCollectionViewCell.m
//  LofterOC
//
//  Created by Elise on 16/9/14.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "FocusSingleCollectionViewCell.h"
#import "FocusScrollSingleView.h"



//每个collectionview的cell
@interface FocusSingleCollectionViewCell ()

@property (nonatomic,strong) FocusScrollSingleView *insideView;

@end


@implementation FocusSingleCollectionViewCell

#pragma mark - lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setViews];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setViews];
    }
    return self;
}


#pragma mark - private 

- (void)setViews {
    self.insideView = [[FocusScrollSingleView alloc] initWithFrame:self.frame];
    [self addSubview:self.insideView];
}

#pragma mark - public 

- (void)setModelForRefresh:(HomeFocusRecomBlogsModel *)model {
    self.model = model;
    self.insideView.model = self.model;
}


@end
