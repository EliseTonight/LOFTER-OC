//
//  HomeSubscribeModel.m
//  LofterOC
//
//  Created by Elise on 16/9/5.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "HomeSubscribeModel.h"
#import <MJExtension/MJExtension.h>

@implementation HomeSubscribeModel

- (NSString *)description {
    return [NSString stringWithFormat:@"name is %@,image is %@,type is %ld,unreadCount is %ld",self.name,self.image,(long)self.type,(long)self.unreadCount];
}


@end


@implementation HomeSubscribeModels

- (NSString *)description {
    return [NSString stringWithFormat:@"tags number is %lu",(unsigned long)self.tags.count];
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{
        @"tags" : @"HomeSubscribeModel"
    };
}

@end