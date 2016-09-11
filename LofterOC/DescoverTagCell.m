//
//  DescoverTagCell.m
//  LofterOC
//
//  Created by Elise on 16/9/1.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "DescoverTagCell.h"
#import "UIImageView+WebCache.h"
#import "DescoverMidModel.h"

@interface DescoverTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;


@end

@implementation DescoverTagCell

#pragma mark - lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addObserver:self forKeyPath:@"model" options:NSKeyValueObservingOptionNew context:DescoverTagCellContextKVO];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context == DescoverTagCellContextKVO) {
        DescoverTagModel *newModel = (DescoverTagModel*)[change objectForKey:NSKeyValueChangeNewKey];
        [self.backImageView sd_setImageWithURL:[NSURL URLWithString:newModel.image] placeholderImage:[UIImage imageNamed:@"quesheng"]];
        self.titleLabel.text = newModel.tagName;
        self.numberLabel.text = [NSString stringWithFormat:@"%ld参与",(long)newModel.postCount];
        for (int i = 0;i <= 2;i++) {
            DescoverMidModelItem *imageModel = (DescoverMidModelItem *)newModel.posts[i];
            switch (i) {
                case 0:
                    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.image] placeholderImage:[self imageWithPureColor:[UIColor clearColor]]];
                    break;
                case 1:
                    [self.midImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.image] placeholderImage:[self imageWithPureColor:[UIColor clearColor]]];
                    break;
                case 2:
                    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.image] placeholderImage:[self imageWithPureColor:[UIColor clearColor]]];
                    break;
                default:
                    break;
            }
        }
    }
}

#pragma mark - class func

+ (DescoverTagCell *)loadDescoverTagCellFromXibWith:(UITableView *)tableView {
    NSString *cellId = @"descoverTagCell";
    DescoverTagCell *reuseCell = (DescoverTagCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    if (reuseCell == nil) {
        reuseCell = (DescoverTagCell *)[[NSBundle mainBundle] loadNibNamed:@"DescoverTagCell" owner:nil options:nil].lastObject;
    }
    return reuseCell;
}

#pragma mark - private 

- (void)addBlurEffectToImage:(UIImageView *)imageView {
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.frame = imageView.frame;
    [imageView addSubview:effectView];
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


@end
