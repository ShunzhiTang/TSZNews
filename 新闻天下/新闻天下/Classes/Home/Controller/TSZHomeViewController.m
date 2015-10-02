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

@interface TSZHomeViewController ()<UICollectionViewDataSource , UICollectionViewDelegate ,TSZTopLabelDelegate>

//数据
@property (nonatomic, strong) NSArray *newsClassfyList;


@property (weak, nonatomic) IBOutlet UIScrollView *progressNews;


@property (unsafe_unretained ,nonatomic)IBOutlet UICollectionView *collectionView;

@property (unsafe_unretained, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@property (nonatomic , assign)NSInteger currentIndex;
@end

@implementation TSZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //设置好新闻头部
    [self setupChannel];
    self.view.backgroundColor = [UIColor cyanColor];
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
    NSInteger index = 0;
    //循环遍历添加 label
    for(TSZNewsClassfiyModel *che in self.newsClassfyList){
        //算出width
        TSZTopLabel *lab = [TSZTopLabel topLabelWithTitle:che.tname];
        
        //设置位置
        lab.frame = CGRectMake(x, 0, lab.bounds.size.width, h);
        lab.tag = index;
        //设置代理
        lab.delegate = self;
        
        //dizeeng
        x += lab.bounds.size.width;
        
        index++;
        //添加
        [self.progressNews addSubview:lab];
    }
    
    //设置滚动
    self.progressNews.contentSize = CGSizeMake(x+margin, h);
    
    //设置第0项
    TSZTopLabel *label = self.progressNews.subviews[0];
    label.scale = 1;
    
}

//怎样去确定当前滑动到了哪一个，使用滚动的代理方法
#pragma mark滚动的代理方法,
//只要滚动一下就调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //1、当前选中的标签
    TSZTopLabel *currentLabel = self.progressNews.subviews[self.currentIndex];

    //下一个标签
    NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
    
    //遍历数组确定写一个标签
    TSZTopLabel *nextLabel = nil;
    for(NSIndexPath *path in indexPaths){
        if (path.item != self.currentIndex) {
            nextLabel = self.progressNews.subviews[path.item];
            break;
        }
    }
    
//    NSLog(@"从 %@到 %@",currentLabel.text , nextLabel.text);
    //判断是否有下一个标签
    if (nextLabel ==nil) {
        return;
    }
    
    //3、设置比例
    float nextScale = ABS((float)self.collectionView.contentOffset.x / self.collectionView.bounds.size.width-self.currentIndex);
    
    float currentScale = 1 - nextScale;
    
    currentLabel.scale = currentScale;
    nextLabel.scale = nextScale;
    //强制更新索引
    self.currentIndex = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
    
}

//当一个collection滚动完成后才执行这个方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //计算出当前的滚动的索引
    
    self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
}

#pragma mark 选择不同的界面 ， 出现对应的标题 协议方法
- (void)topLabelDidSelected:(TSZTopLabel *)label{
    self.currentIndex = label.tag;
    //滚动指定位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:label.tag inSection:0];
    
    //滚动
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
}

@end
