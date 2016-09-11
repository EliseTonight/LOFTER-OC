//
//  DescoverTagCell.h
//  LofterOC
//
//  Created by Elise on 16/9/1.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DescoverTagModel.h"

@interface DescoverTagCell : UITableViewCell

//kvo属性
@property (nonatomic,strong) DescoverTagModel *model;

+ (DescoverTagCell *)loadDescoverTagCellFromXibWith:(UITableView *)tableView;

@end
