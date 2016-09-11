//
//  DescoverExpertModel.h
//  LofterOC
//
//  Created by Elise on 16/8/27.
//  Copyright © 2016年 Elise. All rights reserved.
//

#import <Foundation/Foundation.h>

///发现的第三部分 ,type = 3



//"type": 3,
//"item": [{
//				"blogId": 3725520,
//				"commonUsedTags": ["轻音乐", "每天推首歌给你", "纯音乐", "新世纪", "单曲循环的那首歌", "循环一百遍的歌", "音乐", "钢琴", "电子", "后摇", "吉他", "小提琴"],
//				"posts": [],
//				"blogInfo": {
//                    "blogId": 3725520,
//                    "blogName": "gaojian2013",
//                    "blogNickName": "高山流水的音乐",
//                    "bigAvaImg": "http://img1.ph.126.net/C4yXFqyW2m38I8-Eb8VBSQ==/6599331462075343585.jpg",
//                    "keyTag": "",
//                    "selfIntro": "拍拍照片,听听音乐.微信号:jianjian20062013",
//                    "blogCreateTime": 1398001366485,
//                    "avaUpdateTime": 0,
//                    "rssFileId": 0,
//                    "rssGenTime": 1471937576301,
//                    "postModTime": 1471925613082,
//                    "postAddTime": 1471925613082,
//                    "commentRank": 10,
//                    "imageProtected": true,
//                    "imageStamp": true,
//                    "imageDigitStamp": true,
//                    "gendar": 3,
//                    "birthday": 0,
//                    "novisible": false,
//                    "homePageUrl": "http://gaojian2013.lofter.com"
//                },
//				"tip": "音乐达人",


@interface DescoverExpertBlogModel : NSObject

@property (nonatomic,assign)  NSInteger blogId;
@property (nonatomic,copy)    NSString *blogName;
@property (nonatomic,copy)    NSString *blogNickName;
@property (nonatomic,copy)    NSString *bigAvaImg;
@property (nonatomic,copy)    NSString *selfIntro;
@property (nonatomic,copy)    NSString *homePageUrl;
@property (nonatomic,assign)  NSInteger gendar;
@property (nonatomic,assign)  NSInteger birthday;

@end

@interface DescoverExpertModel : NSObject

@property (nonatomic,assign)  NSInteger blogId;
@property (nonatomic,copy)    NSArray *commonUsedTags;
@property (nonatomic,strong)  DescoverExpertBlogModel *blogInfo;
@property (nonatomic,copy)    NSString *tip;
@property (nonatomic,assign)  NSInteger publicPostCount;
@property (nonatomic,assign)  NSInteger likedCount;

@end

@interface DescoverExpertModels : NSObject

@property (nonatomic,strong)  NSMutableArray *item;
@property (nonatomic,assign)  NSInteger type;

@end
