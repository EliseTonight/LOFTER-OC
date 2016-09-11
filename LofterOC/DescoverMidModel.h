//
//  DescoverMidModel.h
//  LofterOC
//
//  Created by Elise on 16/8/27.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <Foundation/Foundation.h>

///发现的第二部分
@interface DescoverMidModelItem : NSObject

//"item": [{
//				"item": {
//                    "domainId": 1370404026996,
//                    "posts": [{
//                        "type": 2,
//                        "image": "http://imglf0.ph.126.net/O6VqW3WWaVpFPPS7FZAbjg==/6631824229699444011.jpg",
//                        "title": "",
//                        "digest": "<p>月光的线条</p>",
//                        "permalink": "1d77d336_bb6b125",
//                        "valid": 0,
//                        "postId": 196522277,
//                        "blogId": 494392118,
//                        "publishTime": 1468772772318,
//                        "tagIconJsonStr": "{\"imgUrl\":\"http://imglf0.ph.126.net/O6VqW3WWaVpFPPS7FZAbjg\\u003d\\u003d/6631824229699444011.jpg\",\"postType\":2,\"postDesc\":\"\\u003cp\\u003e月光的线条\\u003c/p\\u003e\",\"isGif\":false,\"blogId\":494392118,\"postPublishTime\":1468772772318,\"postTitle\":\"\",\"postId\":196522277}"
//                    }, {

@property (nonatomic,assign) NSInteger type;
@property (nonatomic,copy)   NSString  *title;
@property (nonatomic,copy)   NSString  *image;
@property (nonatomic,copy)   NSString  *digest;

@end


//单个组合图片的model具体
@interface DescoverSingleMidModelDetail : NSObject

@property (nonatomic,strong)   NSMutableArray  *posts;
@property (nonatomic,copy)     NSString  *domainName;
@property (nonatomic,assign)   NSInteger domainID;
//以下仅当type＝2时会赋值
@property (nonatomic,copy)   NSString  *image;
@property (nonatomic,copy)   NSString  *url;


@end


//单个组合图片的model
@interface DescoverSingleMidModel : NSObject

@property (nonatomic,strong)   DescoverSingleMidModelDetail  *item;
///type = 0即四个图组合，还需要domainName,,,type = 2即直接有一个全部组合的名字
@property (nonatomic,assign)   NSInteger type;

@end


//包含所有滑动图片的
@interface DescoverMidModes : NSObject

@property (nonatomic,strong)   NSMutableArray   *item;
@property (nonatomic,assign)   NSInteger type;

@end