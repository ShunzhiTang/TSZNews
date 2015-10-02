//
//  TSZHomeViewController.m
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZHomeViewController.h"
#import "TSZNewsClassfiyModel.h"
#import "TSZTopLabel.h"
#import "TSZNewsClassfiyCell.h"

@interface TSZHomeViewController ()<UICollectionViewDataSource , UICollectionViewDelegate>

//数据
@property (nonatomic, strong) NSArray *newsClassfyList;


@property (weak, nonatomic) IBOutlet UIScrollView *progressNews;


@property (unsafe_unretained ,nonatomic)IBOutlet UICollectionView *collectionView;

@property (unsafe_unretained, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@end

@implementation TSZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //设置好新闻头部
    [self setupChannel];
    
    
}


//注意这个方法:子视图已经布局完成
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //设置布局
    
    [self setUpLayout];
}


#pragma mark 实现collection的数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
 
    return self.newsClassfyList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //测试
    TSZNewsClassfiyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    //设置颜色
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256)/255.0) green:((float)arc4random_uniform(256)/255.0) blue:((float)arc4random_uniform(256)/255.0) alpha:1.0];
    cell.urlString = [self.newsClassfyList[indexPath.item] urlString];
    
    if (![self.childViewControllers containsObject:cell.newsVc]) {
        [self addChildViewController:(UIViewController *)cell.newsVc];
    }
    
    return cell;
}


#pragma mark 加载数据
//懒加载数据

- (NSArray *)newsClassfyList{
    if (_newsClassfyList == nil) {
        _newsClassfyList = [TSZNewsClassfiyModel channelList];
    }
    return _newsClassfyList;
}


#pragma mark设置流水布局

- (void)setUpLayout{
    //大小
    self.layout.itemSize = self.collectionView.bounds.size;
    
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    //滚动方向
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //允许分页
    self.collectionView.pagingEnabled = YES;
    //取消滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
}


#pragma mark 初始化新闻频道
- (void)setupChannel{
    //取消自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //遍历频道数组
    CGFloat margin = 8.0;
    CGFloat x = margin;
    CGFloat h = self.progressNews.bounds.size.height;
    
    //循环遍历添加 label
    for(TSZNewsClassfiyModel *che in self.newsClassfyList){
        //算出width
        TSZTopLabel *lab = [TSZTopLabel topLabelWithTitle:che.tname];
        
        //设置位置
        lab.frame = CGRectMake(x, 0, lab.bounds.size.width, h);
        
        //dizeeng
        x += lab.bounds.size.width;
        
        //添加
        [self.progressNews addSubview:lab];
    }
    
    //设置滚动
    self.progressNews.contentSize = CGSizeMake(x+margin, h);
    
}


@end
