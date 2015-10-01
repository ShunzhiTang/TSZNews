//
//  TSZModels.h
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSZModels : NSObject
//新闻标题
@property (nonatomic, copy) NSString *title;
//新闻摘要
@property (nonatomic, copy) NSString *digest;
//跟帖数量
@property (nonatomic, copy) NSString *replyCount;
//图片的地址
@property (nonatomic, copy) NSString *imgsrc;

 //字典转模型
+(instancetype)newsWithDict:(NSDictionary *)dict;


//下载数据的信息，只是一个测试
+ (void)loadNewsListWithURLString:(NSString *)pathURL;


@end
