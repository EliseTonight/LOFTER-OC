//
//  DescoverTagModel.h
//  LofterOC
//
//  Created by Elise on 16/8/27.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <Foundation/Foundation.h>
///发现的第三部分

//"id": 339001,
//"tagName": "汪星人的日常",
//"normalTag": "汪星人的日常",
//"createTime": 1472003904220,
//"image": "http://imglf0.nosdn.127.net/img/K3dyczlOUGFhVzNJcHdsSkJVUGFpc1FWazRUb010clNjdGp4NGRzTzRVY3pjMmlKZnFidk1nPT0.jpg",
//"content": "<p style=\"padding:0px;margin:0px 0px 10px;color:#444444;font-family:&quot;hiragino sans gb&quot;, &quot;microsoft yahei&quot;, 微软雅黑, tahoma, arial, simsun, 宋体;line-height:22.4px;white-space:normal;background-color:#ededef;\">汪星人的脑子里都装了些什么呢？晒出你家汪星人的日常吧~</p><p style=\"padding:0px;margin:0px 0px 10px;color:#444444;font-family:&quot;hiragino sans gb&quot;, &quot;microsoft yahei&quot;, 微软雅黑, tahoma, arial, simsun, 宋体;line-height:22.4px;white-space:normal;background-color:#ededef;\">banner图来自LO主：<a href=\"http://camellia218.lofter.com/\" target=\"_blank\" style=\"cursor:pointer;color:#444444;outline:none;\">加菲猫猫</a></p>",
//"pv": 2,
//"subscribeCount": 46,
//"shareCount": 0,
//"type": 2,
//"domainId": "0",
//"watermark": false,
//"ext": "{\"rank\":\"0\"}",
//"posts": [{
//    "type": 2,



@interface DescoverTagModel : NSObject

@property (nonatomic,copy)    NSString *tagName;
@property (nonatomic,copy)    NSString *normalTag;
@property (nonatomic,assign)  NSInteger  createTime;
@property (nonatomic,assign)  NSInteger  postCount;

@property (nonatomic,copy)    NSString *image;
@property (nonatomic,copy)    NSMutableString *content;
@property (nonatomic,strong)  NSMutableArray *posts;


@end

@interface DescoverTagModels : NSObject

@property (nonatomic,strong)  NSMutableArray *item;
@property (nonatomic,assign)  NSInteger type;

@end



