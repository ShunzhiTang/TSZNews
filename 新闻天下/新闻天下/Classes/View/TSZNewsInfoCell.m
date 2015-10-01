//
//  TSZNewsInfoCell.m
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZNewsInfoCell.h"


@interface TSZNewsInfoCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;

@property (weak, nonatomic) IBOutlet UILabel *replayCountLabel;

@end


@implementation TSZNewsInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma 重写set方法



@end
