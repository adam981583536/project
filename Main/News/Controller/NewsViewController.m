//
//  NewsViewController.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "NewsViewController.h"
#import "News.h"
#import "OneTableViewCell.h"
#import "OldTable.h"
#import "NewsDetailController.h"
#import "ImageNewsViewController.h"
CGFloat height = 150;
@interface NewsViewController ()
{
    UIImageView *image;
    UILabel *label;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
       
    [self _loadData];
    [self _creatTableView];
    _tableView.backgroundColor = [UIColor clearColor];
    [self _creatView];
//    [self scrollViewDidScroll:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)_creatView{
    image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, height)];
    image.backgroundColor = [UIColor purpleColor];
    News *new = [[News alloc] init];
    new = _data[0];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, height - 30, kScreenWidth, 30)];
    label.text = new.title;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:13];
    label.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    
    
    [image sd_setImageWithURL:[NSURL URLWithString:new.image]];
    
    [image addSubview:label];
    [self.view insertSubview:image belowSubview:_tableView];
    image.contentMode = UIViewContentModeScaleAspectFill;
   
    
    

}

- (void)_creatTableView{
    
   
    _tableView.backgroundColor = [UIColor whiteColor];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
   
    _tableView.rowHeight = 60;
    
    _tableView.separatorColor = [UIColor darkGrayColor];
    
    //注册单元格
    [_tableView registerNib:[UINib nibWithNibName:@"OldTable" bundle:nil] forCellReuseIdentifier:@"0"];
     [_tableView registerNib:[UINib nibWithNibName:@"OneTableViewCell" bundle:nil] forCellReuseIdentifier:@"1"];
 
    [self.view addSubview:_tableView];
    
}
- (void)_loadData{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"news_list" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    _data = [[NSMutableArray alloc] init];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    for (NSDictionary *dic in arr) {
        News *news = [[News alloc] init];
        
        news.newsId = [dic objectForKey:@"id"];
        news.type = [dic objectForKey:@"type"];
        news.title = [dic objectForKey:@"title"];
        news.summary = [dic objectForKey:@"summary"];
        news.image = [dic objectForKey:@"image"];
        [_data addObject:news];
        
    }
    [_tableView reloadData];
}
#pragma mark - Navigation
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        OldTable *cell = [tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        
        cell.news = _data[indexPath.row];
        
//        cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
//        [self scrollViewDidScroll:cell];
        return cell;
    }
    
        
        OldTable *cell = [tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        cell.news = _data[indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
            return cell;
        
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{ NSInteger i = indexPath.row;
    if (i == 0) {
        return 150;
    }
    else{
        return 60;
    }
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 150;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"identifier"];
//    
//    if (headerView == nil) {
//        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"identifier"];
//        
//    }
//    
//    headerView.backgroundColor = [UIColor orangeColor];
//    
//    
//    return headerView;
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 向下拽了多少距离
    CGFloat offsetY = scrollView.contentOffset.y;
    
    //    NSLog(@"%lf", offsetY);
    if (offsetY > 0) { //向上滑动
        image.top = -offsetY * .5;
        
    }else{
        
        //1、计算图片增大之后的高度
        //ABS是取绝对值
        CGFloat height1 = ABS(offsetY) + height;
        //原宽度/ 原高度 = 放大宽度 / 放大高度
        CGFloat width = kScreenWidth / height * height;
        
        CGRect frame = CGRectMake(- (width - kScreenWidth) / 2, 0, width, height1);
        
        image.frame = frame;
    }
    
    
    label.bottom = image.bottom;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    News *news1 = _data[indexPath.row];
    NSInteger num = (NSInteger)[news1.type integerValue];
    
    
    if (num == 0) {//普通新闻
        NewsDetailController *newsDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailController"];
        
        [self.navigationController pushViewController:newsDetail animated:YES];
    }
    if (num == 1) {
        ImageNewsViewController *imageNews = [[ImageNewsViewController alloc] init];
        [self.navigationController pushViewController:imageNews animated:YES];
    }

}
@end
