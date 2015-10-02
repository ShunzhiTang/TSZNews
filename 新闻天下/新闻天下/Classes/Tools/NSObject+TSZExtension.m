//
//  NSObject+TSZExtension.m
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "NSObject+TSZExtension.h"
#import "TSZModels.h"

#import <objc/runtime.h>
const char *kPropertiesKey = "kPropertiesKey";

@implementation NSObject (TSZExtension)

+(instancetype)objectWithDict:(NSDictionary *)dict{
    
    id news = [[self alloc]init];
    
    //使用数组去记录 ,这里一定要和网页上同步 ,
    //这里的只是一个测试取出一部分
    //    NSArray *array = @[@"title", @"digest" , @"replyCount" ,  @"imgsrc"];
    NSArray *array = [self loadNewsList];
    
    //遍历
    for (NSString *key  in array) {
        //如果key存在就进行字典转模型
        if(dict[key] != nil){
            [news setValue:dict[key] forKey:key];
        }
    }
    
    return news;
}



//动态的加载类的属性
+ (NSArray *)loadNewsList{
    //获取关联对象
    NSArray *plist = objc_getAssociatedObject(self, kPropertiesKey);
    if (plist != nil) {
        return plist;
    }
    
    //类  属性计数指针
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSLog(@"属性的数量 ：%u",count);
    //遍历数组
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i<count; ++i) {
        //c语言没有对象的概念
        objc_property_t pty = list[i];
        //属性的名称
        const char *name = property_getName(pty);
        
        //添加到数组
        [arrayM addObject:[NSString stringWithUTF8String:name]];
    }
    
    //释放对象
    free(list);
    
    //设置的关联属性
    
    objc_setAssociatedObject(self, kPropertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    //返回数据
    return objc_getAssociatedObject(self, kPropertiesKey);
    
}

@end
