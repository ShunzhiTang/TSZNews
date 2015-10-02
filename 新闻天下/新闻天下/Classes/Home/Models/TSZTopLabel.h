//
//  TSZTopLabel.h
//  新闻天下
//
//  Created by mac on 15-10-2.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TSZTopLabel;
//要想实现关联 ，必须要使用代理去做
@protocol TSZTopLabelDelegate <NSObject>

- (void)topLabelDidSelected:(TSZTopLabel *)label;
@end


@interface TSZTopLabel : UILabel
+ (instancetype)topLabelWithTitle:(NSString *)title;

//代理 接口
@property (nonatomic , weak) id<TSZTopLabelDelegate> delegate;

//设置字体的变化
@property (nonatomic , assign)float scale;

@end
