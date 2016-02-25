//
//  TopView.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "BaseViewController.h"

@interface TopView : BaseViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    //一开始的时候是想直接弄个tableView但是想想好像tablevie都是
    UITextView *_text;
    UITableView *_topView;
}
@property (nonatomic ,strong) NSMutableArray *data;
@property (nonatomic ,strong) NSMutableArray *comment;

@end
