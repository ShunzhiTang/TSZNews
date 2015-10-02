//
//  NSObject+TSZExtension.h
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TSZExtension)

//字典转模型 ,为了更好地复用性 ，所以
+(instancetype)objectWithDict:(NSDictionary *)dict;

+ (NSArray *)loadNewsList;

@end
