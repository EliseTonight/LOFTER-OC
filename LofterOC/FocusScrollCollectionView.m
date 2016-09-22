//
//  FocusScrollCollectionView.m
//  LofterOC
//
//  Created by Elise on 16/9/13.
//  Copyright © 2016年 Elise. All rights reserved.
//


#import "FocusScrollCollectionView.h"
#import "FocusSingleCollectionViewCell.h"

static NSString *FocusCollectionCellId = @"FocusCollectionCellId";

@interface FocusScrollCollectionView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@end

@implementation FocusScrollCollectionView

#pragma mark - class func

+ (UICollectionViewFlowLayout *)getFocusScrollCollectionViewFlowLayout {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return layout;
}


#pragma mark - lifeCycle

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerClass:[FocusSingleCollectionViewCell class] forCellWithReuseIdentifier:FocusCollectionCellId];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate ,UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.model.recomBlogs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:FocusCollectionCellId forIndexPath:indexPath];
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
