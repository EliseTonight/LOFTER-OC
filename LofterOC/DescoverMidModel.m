//
//  DescoverMidModel.m
//  LofterOC
//
//  Created by Elise on 16/8/27.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "DescoverMidModel.h"
#import <MJExtension/MJExtension.h>

@implementation DescoverMidModelItem

- (NSString *)description {
    return [NSString stringWithFormat:@"type is %ld,title is %@,image is %@,digest is %@",(long)self.type,self.title,self.image,self.digest];
}

@end

@implementation DescoverSingleMidModelDetail

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"posts" : @"DescoverMidModelItem"
             };
}
- (NSString *)description {
    return [NSString stringWithFormat:@"domainName is %@,posts number is %lu or image is %@,url is %@",self.domainName,(unsigned long)self.posts.count,self.image,self.url];
}

@end

@implementation DescoverSingleMidModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"item" : @"DescoverSingleMidModelDetail"
             };
}
- (NSString *)description {
    return [NSString stringWithFormat:@"item is %@,type is %ld",self.item,(long)self.type];
}

@end


@implementation DescoverMidModes

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"item" : @"DescoverSingleMidModel"
             };
}
- (NSString *)description {
    return [NSString stringWithFormat:@"type is %ld,item number is %lu",(long)self.type,(unsigned long)self.item.count];
}

@end