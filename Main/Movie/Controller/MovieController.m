//
//  MovieController.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "MovieController.h"
#import "Movie.h"
#import "USMovieCell.h"
#import "PosterView.h"
@interface MovieController ()

@end

@implementation MovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    self.title = @"北美榜"; //设定模块标题
    //创建导航栏右上角翻转按钮
    [self _loadNavigationItem];
    
    [self _loadPoster];
    
    [self _loadData];
    [self _loadTableView];//****这一步一定要注意你刚开始接受协议是没有用的，因为他还没有创建
    _tableView.delegate = self;
    _tableView.dataSource = self;
    

}
//创建导航栏右上角翻转按钮
- (void)_loadData{
    
    //解析json数据
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    //首先通过一个nsbundle来获取地址
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    //有nsdata来获取地址里面的内容
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    
    //新建数组并且初始化，这个数组的目的就是接受字典里面的东西
    _data = [[NSMutableArray alloc] init];
    
    NSArray *arr = [jsonDic objectForKey:@"subjects"];//jsonDIC是一个字典然后字典里面有数组，数组里面又有字典，然后先从字典取出名为subjects的key，然后这个Key是一个数组
    for (NSDictionary *dic in arr) {//新建一个字典拿到arr里面的东西
        NSDictionary *subject = [dic objectForKey:@"subject"];//因为这是字典里面包含一个字典所以他从那个父字典里面拿出key为subject东西//    NSLog(@"%@", dic);　　NSJSONSerialization提供了将JSON数据转换为Foundation对象（一般都是NSDictionary和NSArray）和Foundation对象转换为JSON数据（可以通过调用isValidJSONObject来判断Foundation对象是否可以转换为JSON数据）。
        //转换json,转换的对象是：NSJSONReadingMutableContainers:换返回一个可变容器，当它错误是采取得放发
        //然后用modle接受，modle是一个具体的东西，view是要显示的东西
        Movie *movie = [[Movie alloc] init];
        movie.average = [[subject objectForKey:@"rating"] objectForKey:@"average"];
        movie.collect_count = [subject objectForKey:@"collect_count"];
        movie.images = [subject objectForKey:@"images"];
        movie.movieID = [subject objectForKey:@"id"];
        movie.title = [subject objectForKey:@"title"];
        movie.subtype = [subject objectForKey:@"subtype"];
        movie.year = [subject objectForKey:@"year"];
        movie.original_title = [subject objectForKey:@"original_title"];
        
        [_data addObject:movie];
        
      
    }
    [_tableView reloadData];
    
    [_posterView setData:_data];
}
- (void)_loadTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
   
    _tableView.hidden = YES;
    
    _tableView.rowHeight = 120;
    
    _tableView.separatorColor = [UIColor darkGrayColor];
    
    [self.view addSubview:_tableView];
//    [_tableView registerNib:[UINib nibWithNibName:@"USMovieCell" bundle:nil] forCellReuseIdentifier:@"movieCell"];

    
    
    [_tableView registerNib:[UINib nibWithNibName:@"USMovieCell" bundle:nil] forCellReuseIdentifier:@"id"];
//    [_tableView registerClass:[USMovieCell class] forCellReuseIdentifier:@"id"];
    
    
}

- (void)_loadNavigationItem{
    
    //1、创建翻转的父视图
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    //2、创建右侧2个翻转按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    button1.frame = buttonView.bounds;
    button1.tag = 200;
    
    [button1 addTarget:self action:@selector(rightBarClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    button2.frame = buttonView.bounds;
    button2.tag = 201;
    button2.hidden = YES;
    
    [button2 addTarget:self action:@selector(rightBarClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:button2];
    
    
    //把父视图给页面右边按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:buttonView];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)flipView:(UIView *)view left:(BOOL)flag{
    UIViewAnimationOptions flip = flag ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:view duration:0.5 options:flip animations:^{
        [view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:NULL];

}
- (void)_loadPoster{
    _posterView = [[PosterView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    
    _posterView.hidden = NO;
    
    [self.view addSubview:_posterView];
    
}
- (void)rightBarClickAction:(UIButton *)button{
    //1、通过button.superView
    //2、通过拿rightBarButtonItem
    UIView *buttonView = self.navigationItem.rightBarButtonItem.customView;
    //拿到button1，和button2
    UIButton *button1 = (UIButton *)[buttonView viewWithTag:200];
    UIButton *button2 = (UIButton *)[buttonView viewWithTag:201];
    button1.hidden = !button1.hidden;
    button2.hidden = !button2.hidden;
    [self flipView:buttonView left:button1];
    _tableView.hidden = !_tableView.hidden;
    _posterView.hidden = !_posterView.hidden;
    [self flipView:self.view left:button1];
    //三目运算符
}
#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *identify = @"movieCell";
//    USMovieCell *cell =[tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    USMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath]; 
    cell.movie = _data[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell = [[[NSBundle mainBundle] loadNibNamed:@"USMovieCell" owner:self options:nil]lastObject];为寻找xib的路径，录入它的名字，要使用的对象- (NSArray *)loadNibNamed:(NSString *)name owner:(id)owner options:(NSDictionary *)options
    
//    cell = [[[NSBundle mainBundle] loadNibNamed:@"USMovieCell" owner:self options:nil]lastObject];//为寻找xib的路径，录入它的名字，要使用的对象- (NSArray *)loadNibNamed:(NSString *)name owner:(id)owner options:(NSDictionary *)options
    cell.backgroundColor = [UIColor clearColor];
    //    参数：
    //    name：nib文件的名称
    //
    //    owner：指定name参数所指代的nib文件的File's Owner
    //
    //    options：当nib文件开始时，需要的数据
    //    
    //    返回值：返回符合对象的数组。
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
