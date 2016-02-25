//
//  MovieController.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//
//JSONKit / TouchJson / SBJSON
//NSJSONSerializationn
//JSON数据 ->解析 -> 提取数据

#import "BaseViewController.h"
@class PosterView;
@interface MovieController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    PosterView *_posterView;//创建海报视图
    NSMutableArray *_data;
}
- (void)flipView:(UIView *)view left:(BOOL)flag;//翻转的Bool值
@end
