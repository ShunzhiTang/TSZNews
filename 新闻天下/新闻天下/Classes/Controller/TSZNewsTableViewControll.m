//
//  TSZNewsTableViewControll.m
//  新闻天下
//
//  Created by mac on 15-9-30.
//  Copyright (c) 2015年 tsz. All rights reserved.
//

#import "TSZNewsTableViewControll.h"
#import "TSZModels.h"
#import "TSZNetWorkingTools.h"
@interface TSZNewsTableViewControll ()

//这是一个存储信息的数组
@property (nonatomic, strong) NSArray *newsList;
@end

@implementation TSZNewsTableViewControll

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [TSZModels  loadNewsListWithURLString:@"T1348647853363/0-20.html"];
}

#pragma mark dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.newsList.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//}

#pragma 数组的懒加载
- (NSArray *)newsList{
    
    if (_newsList == nil) {
        _newsList = [NSArray array];
    }
    return _newsList;
}

@end
