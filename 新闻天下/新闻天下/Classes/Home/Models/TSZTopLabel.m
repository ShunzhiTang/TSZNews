//
//  TSZTopLabel.m
//  新闻天下
//
//  Created by mac on 15-10-2.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZTopLabel.h"
//两个宏定义
#define normalFontSize  14.0
#define selectFontSize  18.0

@implementation TSZTopLabel

//实现top文字的变化
+ (instancetype)topLabelWithTitle:(NSString *)title{
    TSZTopLabel *lab = [[TSZTopLabel alloc]init];
    
    lab.text = title;
    //设置对齐方式
    lab.textAlignment = NSTextAlignmentCenter;
    
    //设置大字体
    lab.font = [UIFont systemFontOfSize:selectFontSize];
    
    //根据字体大小设置
    [lab sizeToFit];
    
    //小字体
    lab.font = [UIFont systemFontOfSize:normalFontSize];
    return lab;
}

@end
