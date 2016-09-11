//
//  DescoverTagModel.m
//  LofterOC
//
//  Created by Elise on 16/8/27.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "DescoverTagModel.h"
#import "DescoverMidModel.h"
#import <MJExtension/MJExtension.h>

@implementation DescoverTagModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"posts" : @"DescoverMidModelItem"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"tagName is %@,normalTag is %@ creatTime is %ld,image is %@,posts number is %lu",self.tagName,self.normalTag,(long)self.createTime,self.image,(unsigned long)self.posts.count];
}

@end

@implementation DescoverTagModels

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"item" : @"DescoverTagModel"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"type is %ld,item number is %lu",(long)self.type,(unsigned long)self.item.count];
}

@end