//
//  TSZNetWorkingTools.m
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZNetWorkingTools.h"

@implementation TSZNetWorkingTools


+ (instancetype)sharedNetTools{
    //单例的实现
    static TSZNetWorkingTools *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        //这是路径前面的部分，只有后边的不一样
        
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        
        instance = [[self alloc] initWithBaseURL:url];
        
        //添加解析的数据类型
        // 如果需要添加，可以按照以下代码添加，`官方`推荐的方法！
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
    });
    return instance;
}
@end
