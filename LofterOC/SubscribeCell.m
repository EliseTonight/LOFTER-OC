//
//  SubscribeCell.m
//  LofterOC
//
//  Created by Elise on 16/9/5.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "SubscribeCell.h"
#import "HomeSubscribeModel.h"
#import "UIImageView+WebCache.h"

@interface SubscribeCell ()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *countLabel;
@property (nonatomic,strong) UIView  *topLineView;


@end

@implementation SubscribeCell

#pragma mark - lifeCycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addObserver:self forKeyPath:@"model" options:NSKeyValueObservingOptionNew context:SubscribeCellContextKVO];
        [self setViews];
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - private

- (void)setViews {
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 8, 44, 44)];
    [self addSubview:self.iconImageView];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame) + 8, 8, 50, 44)];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    self.nameLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:self.nameLabel];
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 58, 8, 50, 44)];
    self.countLabel.font = [UIFont systemFontOfSize:14];
    self.countLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.countLabel];
    
    self.topLineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame) + 8, 0, AppWidth - CGRectGetMaxX(self.iconImageView.frame) - 8, 0.5)];
    self.topLineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.topLineView];
}

- (UIImage *)imageWithPureColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  image;
}



#pragma mark - KVO 

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == SubscribeCellContextKVO) {
        HomeSubscribeModel *newModel = (HomeSubscribeModel*)[change objectForKey:NSKeyValueChangeNewKey];
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:newModel.image] placeholderImage:[self imageWithPureColor:[UIColor clearColor]]];
        self.nameLabel.text = newModel.name;
        self.countLabel.text = [NSString stringWithFormat:@"%lu",newModel.unreadCount];
    }
}


@end
