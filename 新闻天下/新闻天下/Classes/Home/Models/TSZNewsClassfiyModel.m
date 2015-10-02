//
//  TSZNewsClassfiyModel.m
//  新闻天下
//
//  Created by mac on 15-10-2.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZNewsClassfiyModel.h"
#import "NSObject+TSZExtension.h"
@implementation TSZNewsClassfiyModel

//重写get方法，加载数据
+ (NSArray *)channelList{
    //1、获取资源
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    
    //2、加载二进制数据
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //3、反序列化
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    //4、字典中得到数据,得到第一个数据
    NSArray *array = dict[dict.keyEnumerator.nextObject];
    
    //5、遍历数组，字典转模型
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    
    for(NSDictionary *dict in arrayM){
        [arrayM addObject:[self objectWithDict:dict]];
    }
    
    return arrayM.copy;
}

//重写打印的方法
- (NSString *)description{
    
    NSArray *pro = [self.class loadNewsList];
    
    NSDictionary *dict = [self  dictionaryWithValuesForKeys:pro];
    
     return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}




@end
