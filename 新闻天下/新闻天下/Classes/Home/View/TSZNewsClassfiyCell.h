//
//  TSZNewsClassfiyCell.h
//  新闻天下
//
//  Created by mac on 15-10-2.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSZNewsTableViewControll.h"
@interface TSZNewsClassfiyCell : UICollectionViewCell

//切换不同的新闻路径，加载url
@property (nonatomic , strong)NSString *urlString;


//新闻视图控制器
@property (nonatomic, strong) TSZNewsTableViewControll *newsVc;

@end
