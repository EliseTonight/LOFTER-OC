//
//  HomeFocusModel.m
//  LofterOC
//
//  Created by Elise on 16/9/5.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import "HomeFocusModel.h"
#import <MJExtension/MJExtension.h>



@implementation HomeFocusCommentModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"userId" : @"id"
             };
}

@end

@implementation HomeFocusPostModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"postHot" : @"postCount.postHot",
             @"responseCount" : @"postCount.responseCount"
             };
}

@end

@implementation HomeFocusRecomBlogsModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"posts" : @"HomeFocusRecomBlogsPostsModel"
             };

}

@end

@implementation HomeFocusModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"post" : @"HomeFocusPostModel",
             @"comments" : @"HomeFocusCommentModel",
             @"recomBlogs" : @"HomeFocusRecomBlogsModel"
             };
}


@end



@implementation HomeFocusModels

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"items" : @"HomeFocusModel"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"get item number is %lu",(unsigned long)self.items.count];
}

@end