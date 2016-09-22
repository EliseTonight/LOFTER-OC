//
//  HomeFocusHeadModel.m
//  LofterOC
//
//  Created by Elise on 16/9/22.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "HomeFocusHeadModel.h"
#import <MJExtension/MJExtension.h>

@implementation HomeFocusHeadModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"img" : @"recdata.img",
             @"width" : @"recdata.width",
             @"height" : @"recdata.height",
             @"url" : @"recdata.object.url"
             };
}

@end
