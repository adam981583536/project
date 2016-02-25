//
//  NewsViewController.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_data;
   
    __weak IBOutlet UITableView *_tableView;
}
@end
