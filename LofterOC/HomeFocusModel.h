//
//  HomeFocusModel.h
//  LofterOC
//
//  Created by Elise on 16/9/5.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DescoverExpertModel.h"




@interface HomeFocusCommentModel : NSObject

@property (nonatomic,strong) DescoverExpertBlogModel *publisherMainBlogInfo;
@property (nonatomic,assign) NSInteger postId;
@property (nonatomic,copy)   NSString *content;
@property (nonatomic,assign) NSInteger userId;

@end


@interface HomeFocusPostModel : NSObject

@property (nonatomic,copy) NSString *tag;
@property (nonatomic,copy) NSString *digest;
@property (nonatomic,strong) DescoverExpertBlogModel *blogInfo;
@property (nonatomic,copy)   NSMutableArray *firstImageUrl;
@property (nonatomic,copy)   NSString *caption;
@property (nonatomic,copy)   NSString *blogPageUrl;
@property (nonatomic,copy)   NSString *firstSmallImageUrl;
//post count
@property (nonatomic,assign) NSInteger responseCount;
@property (nonatomic,assign) NSInteger postHot;

@end


@interface HomeFocusRecomBlogsPostsModel : NSObject

@property (nonatomic,copy)   NSString *image;
@property (nonatomic,copy)   NSString *digest;
@property (nonatomic,copy)   NSString *tagIconJsonStr;

@end


//每一个scrollview的cell里的一个单元
@interface HomeFocusRecomBlogsModel : NSObject

@property (nonatomic,strong) NSMutableArray *posts;
@property (nonatomic,strong) DescoverExpertBlogModel *blogInfo;
@property (nonatomic,assign) NSInteger publicPostCount;
@property (nonatomic,assign) NSInteger likedCount;

@end


//每个cell的model
@interface HomeFocusModel : NSObject

///eventId为0，则是含有scrollview的cell
@property (nonatomic,assign) NSInteger eventId;
@property (nonatomic,strong) HomeFocusPostModel *post;
@property (nonatomic,strong) NSMutableArray *comments;
///eventId为0,才有的model
@property (nonatomic,strong) NSMutableArray *recomBlogs;

@end



@interface HomeFocusModels : NSObject

@property (nonatomic,strong) NSMutableArray *items;

@end