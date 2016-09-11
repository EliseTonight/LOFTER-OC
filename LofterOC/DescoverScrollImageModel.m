//
//  DescoverScrollImageModel.m
//  LofterOC
//
//  Created by Elise on 16/8/27.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "DescoverScrollImageModel.h"
#import <MJExtension/MJExtension.h>

@implementation DescoverScrollImageModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"url" : @"object.url"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"type is %ld,title is %@,img is %@,url is %@",(long)self.type,self.title,self.img,self.url];
}



@end


@implementation DescoverScrollImageModels

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"item" : @"DescoverScrollImageModel"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"get item number is %lu",(unsigned long)self.item.count];
}

@end