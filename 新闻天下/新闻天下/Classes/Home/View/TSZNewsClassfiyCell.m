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
#import "TSZNewsTableViewControll.h"

@interface TSZNewsClassfiyCell()

@property (nonatomic , strong)TSZNewsTableViewControll *newsVC;

@end

@implementation TSZNewsClassfiyCell


//使用awakeFromNib去设置界面的元素
- (void)awakeFromNib{

    //加载新闻视图控制器
    UIStoryboard *sb= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //指定为初始控制器
    self.newsVC = sb.instantiateInitialViewController;
    
    //添加视图
    [self addSubview:self.newsVC.view];
}

//记住设置子视图的大小都在这里去设置
- (void)layoutSubviews{
    
    //记住一定要调用父类的方法
    [super layoutSubviews];
    
    self.newsVC.view.frame = self.bounds;
}



@end
