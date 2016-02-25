//
//  TopView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "TopView.h"
#import "TableViewCell.h"
#import "Top.h"
#import "TopTableViewCell.h"
@interface TopView ()

@end

@implementation TopView
- (instancetype)init
{
    self = [super init];
    if (self) {
         self.title = @"电影详情";
        self.navigationItem.hidesBackButton = NO;
//该返回按钮样式   UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(doneAction:)];
//        self.navigationItem.leftBarButtonItem = item;
        
        
            }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self _creatTableView];
    [self _creatText];
    
    [self _loadComment];
    [self _loadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)_creatText{
    _text.delegate = self;
    _text = [[UITextView alloc] initWithFrame:CGRectMake(142, 90, 150, 45)];
    _text.font = [UIFont systemFontOfSize:15];
    _text.backgroundColor = [UIColor clearColor];
    _text.textColor = [UIColor whiteColor];
    
}
- (void)_creatTableView{
    _topView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-50)];
   
    _topView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _topView.delegate = self;
    _topView.dataSource = self;
    [_topView registerNib:[UINib nibWithNibName:@"TableView" bundle:nil] forCellReuseIdentifier:@"1"];
    [_topView registerNib:[UINib nibWithNibName:@"TopTableViewCell" bundle:nil] forCellReuseIdentifier:@"0"];
    
    [self.view addSubview:_topView];
    
}
- (void)_loadComment{
    NSDictionary *dicJson = [LoadData requestData:@"movie_comment.json"];
    _comment = [[NSMutableArray alloc] init];
    NSMutableArray *arr =[dicJson objectForKey:@"list"];
    for (NSDictionary *dic in arr) {
        Top *top = [[Top alloc] init];
        top.userImage = [dic objectForKey:@"userImage"];
        top.nickname = [dic objectForKey:@"nickname"];
        top.rating = [dic objectForKey:@"rating"];
        top.content = [dic objectForKey:@"content"];
        [_comment addObject:top];
    }
    [_topView reloadData];
}
- (void)_loadData{
    NSDictionary *dic = [LoadData requestData:@"movie_detail.json"];
    _data = [[NSMutableArray alloc] init];
    Top *top = [[Top alloc] init];
    top.image = [dic objectForKey:@"image"];
    top.titleCn = [dic objectForKey:@"titleCn"];
    top.type = [dic objectForKey:@"type"];
    top.directors = [dic objectForKey:@"directors"];
    top.actors = [dic objectForKey:@"actors"];
    top.time = [dic objectForKey:@"release"];
    top.Videos = [dic objectForKey:@"videos"];
    top.content = [dic objectForKey:@"content"];
    [_data addObject:top];
    _text.text = top.content;
    [_topView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return  _comment.count + 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        
        cell.top = _data[indexPath.row];
        
        [cell addSubview:_text];
        cell.backgroundColor = [UIColor clearColor];
        
        //        cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //        [self scrollViewDidScroll:cell];
        return cell;
    }
    else {
    
    TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
    
    cell.top = _comment[indexPath.row - 1];//发生数组越界，因为数组还是从第0个开始计算的，而这个则是从第一个开始进行计算这样就会导致他是从第二个数据开始取，然后发生错误
        
        
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
    
    
    }
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 275;
    }
    return 100;
    
}
@end
