//
//  ImagePieceView.m
//  LofterOC
//
//  Created by Elise on 16/8/31.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "ImagePieceView.h"
#import "UIImageView+WebCache.h"

@interface ImagePieceView ()

{
    DescoverSingleMidModel *selfModel;
}

@end

@implementation ImagePieceView


#pragma mark - lifeCycle

- (instancetype)initWithFrame:(CGRect)frame withModel:(DescoverSingleMidModel *)model {
    self = [super initWithFrame:frame];
    if (self) {
        selfModel = model;
        [self setViewWithModel];
    }
    return self;
}

#pragma mark - private

- (void)setViewWithModel {
    //四个图拼装
    if (selfModel.type == 0) {
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height / 6)];
        nameLabel.font = [UIFont systemFontOfSize:13 weight:13];
        nameLabel.textColor = [UIColor darkTextColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.text = selfModel.item.domainName;
        [self addSubview:nameLabel];
        //设置4个view
        CGFloat crackWidth = 2;
        CGFloat pictureHeight = (self.frame.size.height - 3 * crackWidth - nameLabel.frame.size.height) / 2;
        CGFloat pictureWidth = (self.frame.size.width - 3 * crackWidth) / 2;
        for (int i = 0;i <= 3;i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            DescoverMidModelItem * itemModel = (DescoverMidModelItem *)selfModel.item.posts[i];
            switch (i) {
                case 0:
                    imageView.frame = CGRectMake(crackWidth, nameLabel.frame.size.height + crackWidth, pictureWidth, pictureHeight);
                    break;
                case 1:
                    imageView.frame = CGRectMake(crackWidth * 2 + pictureWidth, nameLabel.frame.size.height + crackWidth, pictureWidth, pictureHeight);
                    break;
                case 2:
                    imageView.frame = CGRectMake(crackWidth, nameLabel.frame.size.height + crackWidth * 2 + pictureHeight, pictureWidth, pictureHeight);
                    break;
                case 3:
                    imageView.frame = CGRectMake(crackWidth * 2 + pictureWidth, nameLabel.frame.size.height + crackWidth * 2 + pictureHeight, pictureWidth, pictureHeight);
                    break;
                default:
                    break;
            }
            [imageView sd_setImageWithURL:[NSURL URLWithString:itemModel.image] placeholderImage:[self imageWithPureColor:[UIColor whiteColor]]];
            [self addSubview:imageView];
        }
        
        
    }
    if (selfModel.type == 2) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:self.frame];
        [image sd_setImageWithURL:[NSURL URLWithString:selfModel.item.url] placeholderImage:[self imageWithPureColor:[UIColor whiteColor]]];
        [self addSubview:image];
    }
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



#pragma mark - class func

+ (ImagePieceView *)loadImagePieceViewWithMatchModel:(DescoverSingleMidModel *)model withFrame:(CGRect)frame {
    ImagePieceView *view = [[ImagePieceView alloc] initWithFrame:frame withModel:model];
    return view;
}

@end
