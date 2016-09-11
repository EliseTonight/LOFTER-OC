//
//  DescoverExpertModel.m
//  LofterOC
//
//  Created by Elise on 16/8/27.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "DescoverExpertModel.h"
#import <MJExtension/MJExtension.h>


@implementation DescoverExpertBlogModel

- (NSString *)description {
    return [NSString stringWithFormat:@"blogId is %ld,blogName is %@, blogNickName is %@,bigAvaImg is %@,selfIntro is %@,homePageUrl is %@,gender is %ld,birthday is %ld",(long)self.blogId,self.blogName,self.blogNickName,self.bigAvaImg,self.selfIntro,self.homePageUrl,(long)self.gendar,(long)self.birthday];
}

@end


@implementation DescoverExpertModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"blogInfo" : @"DescoverExpertBlogModel"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"commonUsedTags number is %lu,tip is %@, publicPostCount is %ld,likedCount is %ld,blogInfo is %@",(unsigned long)self.commonUsedTags.count,self.tip,(long)self.publicPostCount,(long)self.likedCount,self.blogInfo];
}

@end

@implementation DescoverExpertModels

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"item" : @"DescoverExpertModel"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"item number is %lu,type is %ld",(unsigned long)self.item.count,(long)self.type];
}

@end