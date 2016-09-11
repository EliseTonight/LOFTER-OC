//
//  DescoverScrollImageModel.h
//  LofterOC
//
//  Created by Elise on 16/8/27.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <Foundation/Foundation.h>
///发现的第一部分
@interface DescoverScrollImageModel : NSObject

//"type": 4,
//"title": "",
//"img": "http://imglf2.nosdn.127.net/img/enZpc3BkNzc2SFdldGFZcHR0bStFL081Wk1GNVg2YXFKM0diZDRnYkdYVi9kdkJ5cW82Wm13PT0.jpg?imageView",
//"createTime": 0,
//"endTime": 1472184000000,
//"height": 0,
//"width": 0,
//"object": {
//    "img": "http://imglf2.nosdn.127.net/img/enZpc3BkNzc2SFdldGFZcHR0bStFL081Wk1GNVg2YXFKM0diZDRnYkdYVi9kdkJ5cW82Wm13PT0.jpg?imageView",
//    "desc": "",
//    "url": "http://www.lofter.com/act/mvp?code=58941"
//},
//

@property (nonatomic,assign) NSInteger type;
@property (nonatomic,copy)   NSString  *title;
@property (nonatomic,copy)   NSString  *img;
@property (nonatomic,copy)   NSString  *url;


@end

//包含了全部头部图片的model
@interface DescoverScrollImageModels : NSObject

@property (nonatomic,strong) NSMutableArray *item;




@end