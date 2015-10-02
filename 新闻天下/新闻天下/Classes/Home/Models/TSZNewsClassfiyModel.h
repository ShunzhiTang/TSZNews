//
//  TSZNewsClassfiyModel.h
//  新闻天下
//
//  Created by mac on 15-10-2.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSZNewsClassfiyModel : NSObject


//从分析中我可以知道，在那个如何分类的文件中 分类名和请求相对路径不同 ，所以建立下列模型
@property (nonatomic , copy)NSString *tname;
@property (nonatomic, strong) NSString *tid;


//加载频道的所有数据

+ (NSArray *)channelList;
@end
