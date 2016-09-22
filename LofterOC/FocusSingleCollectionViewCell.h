//
//  FocusSingleCollectionViewCell.h
//  LofterOC
//
//  Created by Elise on 16/9/14.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeFocusModel.h"

@interface FocusSingleCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) HomeFocusRecomBlogsModel *model;

- (void)setModelForRefresh:(HomeFocusRecomBlogsModel *)model;

@end
