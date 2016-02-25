//
//  CinemaViewController.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "BaseViewController.h"

@interface CinemaViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate>
{

    __weak IBOutlet UITableView *_cinemaTableView;

}
@property (nonatomic ,strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *MovieData;
@property (nonatomic ,strong) NSMutableArray *selectData;
@property (nonatomic ,strong) NSMutableArray *selectMovie;
@end
