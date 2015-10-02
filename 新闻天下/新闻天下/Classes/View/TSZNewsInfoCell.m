//
//  TSZNewsInfoCell.m
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZNewsInfoCell.h"
#import "TSZModels.h"
#import "UIImageView+AFNetworking.h"
@interface TSZNewsInfoCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;

@property (weak, nonatomic) IBOutlet UILabel *replayCountLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *moreImageView;



@end


@implementation TSZNewsInfoCell

- (void)awakeFromNib {
    
    //设置换行宽度
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(self.iconImage.frame) - 50;
}


#pragma 重写set方法
- (void)setModels:(TSZModels *)models{
    _models = models;
    //设置显示信息
    self.titleLabel.text = models.title;
    self.digestLabel.text = models.digest;
    self.replayCountLabel.text = [NSString stringWithFormat:@"%d",models.replyCount];
    //在设置图像之前，先清空图像
    
    self.iconImage.image = nil;
//    self.iconImage = nil;
    //图片 等会实现
    [self.iconImage setImageWithURL:[NSURL URLWithString:models.imgsrc]];
    
    //判断模型是否带多图
    if (models.imgextra.count == 2) {
        int index = 0;
        for (UIImageView *iv in self.moreImageView) {
            NSString *urlString = models.imgextra[index][@"imgsrc"];
            
            NSURL *url = [NSURL URLWithString:urlString];
            
            //设置图像
            iv.image = nil;
            
            [iv setImageWithURL:url];
            index++;
        }
    }
}

+(NSString *)cellIdentifier:(TSZModels *)model{
    if (model.imgextra.count == 2) {
        return @"moreImageCell";
    }
    
    if (model.isBigImage){
        return @"bigImageCell";
    }
    return @"newsCell";
}

@end
