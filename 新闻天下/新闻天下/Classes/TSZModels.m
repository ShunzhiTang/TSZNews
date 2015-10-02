//
//  TSZModels.m
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZModels.h"
#import "TSZNetWorkingTools.h"
//运行时机制的实现 ，就是实现数据的关联
#import <objc/runtime.h>

#import "NSObject+TSZExtension.h"
@implementation TSZModels

//重写NSLog的输出方法description
- (NSString *)description{
    NSArray *arr = @[@"title", @"digest" , @"replyCount" ,  @"imgsrc"];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:arr];
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}

//一般把数据的数组都放在model
+ (void)loadNewsListWithURLString:(NSString *)pathURL finised:(void (^)(NSArray *))finised{
    //加入断言
    NSAssert(finised !=nil, @"必须传入回调");
    
    [[TSZNetWorkingTools sharedNetTools] GET:pathURL parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        //首先这个路径下的网页是json数据，数组中有很多的字典
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        
//        NSLog(@"%@",array);
        //根据key拿到第一个数组 ,在这里进行字典转模型
        NSMutableArray *arrayM = [[NSMutableArray alloc]initWithCapacity:array.count];
        //使用增强for循环进行遍历
        
        for (NSDictionary *dict in array) {
            [arrayM addObject:[self objectWithDict:dict]];
        }
        
        //回调
        finised(arrayM.copy);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
@end
