//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.

#import "TSZNewsTableViewControll.h"
#import "TSZModels.h"
#import "TSZNetWorkingTools.h"
#import "TSZNewsInfoCell.h"
@interface TSZNewsTableViewControll ()

//这是一个存储信息的数组
@property (nonatomic, strong) NSArray *newsList;
@end

@implementation TSZNewsTableViewControll

#pragma 数组的set方法的实现

- (void)setNewsList:(NSArray *)newsList{
    _newsList = newsList;
    //刷新表格
    [self.tableView reloadData];
}

//路径的set方法
- (void)setUrlString:(NSString *)urlString{
    _urlString = urlString;
    //先清空数据
    self.newsList = nil;
    
    //防止循环引用
    __weak typeof(self) weakSelf = self;
    
    [TSZModels  loadNewsListWithURLString:urlString finised:^(NSArray *newsInfo) {
        weakSelf.newsList = newsInfo;
    }];
}

//在这里想到：我们的数据在模型中加载完成的，那么要去实现数据的传输 ，就要想到block

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置预估高度
    self.tableView.estimatedRowHeight = 80;
    //注意cell中不可以有负的约束
    self.tableView.rowHeight = UITableViewAutomaticDimension;
   
    
}

#pragma mark dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取数据
    TSZModels *model = self.newsList[indexPath.row];
    
    NSString *ID = [TSZNewsInfoCell cellIdentifier:model];
    
    //创建cell
    TSZNewsInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.models = model;
    
    return cell;
}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
