//
//  FocusScrollCollectionView.h
//  LofterOC
//
//  Created by Elise on 16/9/13.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeFocusModel.h"

@interface FocusScrollCollectionView : UICollectionView

@property (nonatomic,strong) HomeFocusModel *model;

+ (UICollectionViewFlowLayout *)getFocusScrollCollectionViewFlowLayout;

@end
