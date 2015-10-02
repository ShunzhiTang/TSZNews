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
    
    //允许交互
    [lab setUserInteractionEnabled:YES];
    return lab;
}

- (void)setScale:(float)scale{
    
    float per = (selectFontSize - normalFontSize) / normalFontSize;
    per = per *scale + 1;
    //通过transfrom设置大小
    self.transform = CGAffineTransformMakeScale(per, per);
    
    //设置颜色
    self.textColor = [[UIColor alloc]initWithRed:scale green:0 blue:0 alpha:1.0];
}

//可以实现点击 切换下面的collection
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    if ([self.delegate respondsToSelector:@selector(topLabelDidSelected:)]) {
        [self.delegate topLabelDidSelected:self];
    }
}

@end


