//
//  FocusScrollCell.m
//  LofterOC
//
//  Created by Elise on 16/9/11.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "FocusScrollCell.h"
#import "FocusScrollSingleView.h"


static CGFloat singleViewWidth = 300;
static CGFloat singleViewGap = 10;

@interface FocusScrollCell ()

@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) UILabel *nameLabel;

@end

@implementation FocusScrollCell


#pragma mark - lifeCycle

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark - lazy property

- (UIScrollView *)mainScrollView {
    if (_mainScrollView == nil) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        _mainScrollView.contentSize = CGSizeMake(singleViewWidth * self.model.recomBlogs.count, 0);
        _mainScrollView.showsVerticalScrollIndicator = false;
        _mainScrollView.showsHorizontalScrollIndicator = false;
        _mainScrollView.pagingEnabled = false;
        _mainScrollView.delegate = self;
        _mainScrollView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    }
    return _mainScrollView;
}


#pragma mark - private

- (void)setUpViews {
    
}





@end
