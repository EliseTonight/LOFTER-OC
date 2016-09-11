//
//  ImagePieceView.h
//  LofterOC
//
//  Created by Elise on 16/8/31.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DescoverMidModel.h"

@interface ImagePieceView : UIView

+ (ImagePieceView *)loadImagePieceViewWithMatchModel:(DescoverSingleMidModel *)model withFrame:(CGRect)frame;

@end
