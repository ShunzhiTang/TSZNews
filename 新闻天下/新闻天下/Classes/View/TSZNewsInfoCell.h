//
//  TSZNewsInfoCell.h
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import <UIKit/UIKit.h>

//一般就是要在这里设置一个模型的属性用于传值
@class TSZModels;
@interface TSZNewsInfoCell : UITableViewCell

@property (nonatomic, strong) TSZModels *models;

+(NSString *)cellIdentifier:(TSZModels *)model;
@end
