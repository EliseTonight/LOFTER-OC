//
//  HomeSubscribeModel.h
//  LofterOC
//
//  Created by Elise on 16/9/5.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <Foundation/Foundation.h>


//首页－订阅
//"name": "女装",
//"image": "http://imglf0.nosdn.127.net/img/TUlQVWNxUlJNZUNQeG84eDgxNFNiRGJsY1o0RHI4dDRoOURQNFhLUHJ3YjJScWVaMDNJbkFnPT0.jpg?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg",
//"type": 2,
//"title": "",
//"content": "<p>Kristen Stewart《Elle》中国版2016年9月刊<br /></p>",
//"unreadCount": 7342,
//"recReason": "",
//"subscribedCount": 0,
//"subscribe": true,
//"gif": false
@interface HomeSubscribeModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,assign) NSInteger unreadCount;

@end

@interface HomeSubscribeModels : NSObject

@property (nonatomic,strong) NSMutableArray *tags;

@end