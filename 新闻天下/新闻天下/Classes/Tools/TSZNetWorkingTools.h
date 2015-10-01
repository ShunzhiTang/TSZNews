//
//  TSZNetWorkingTools.h
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface TSZNetWorkingTools : AFHTTPSessionManager

//这是一个单例类，提供一个单例的入口
+ (instancetype)sharedNetTools;


@end
