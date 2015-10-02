//
//  TSZNewsClassfiyCell.m
//  新闻天下
//
//  Created by mac on 15-10-2.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZNewsClassfiyCell.h"

/**
 *  导入新闻的版块
 */
@interface TSZNewsClassfiyCell()


@end

@implementation TSZNewsClassfiyCell


//使用awakeFromNib去设置界面的元素
- (void)awakeFromNib{
    
    
    //加载新闻视图控制器
    UIStoryboard *sb= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //指定为初始控制器
    self.newsVc = sb.instantiateInitialViewController;
    
    //添加视图
    [self addSubview:self.newsVc.view];
}

//记住设置子视图的大小都在这里去设置
- (void)layoutSubviews{
    
    //记住一定要调用父类的方法
    [super layoutSubviews];
    
    self.newsVc.view.frame = self.bounds;
}

//重写  url的set方法
- (void)setUrlString:(NSString *)urlString{
    _urlString = urlString;
    self.newsVc.urlString = urlString;
}


@end
