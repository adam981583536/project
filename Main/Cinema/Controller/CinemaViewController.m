//
//  CinemaViewController.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "CinemaViewController.h"
#import "Cinema.h"
#import "CinemaTableViewCell.h"
@interface CinemaViewController ()

@end
static NSString *identify = @"movieCell";
@implementation CinemaViewController{

    BOOL _flag[100];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    [self _loadMovieData];
    [self _loadData];
   [self _creatTableView];
    
}



- (void)_creatTableView{
    
    _cinemaTableView.delegate = self;
    _cinemaTableView.dataSource = self;
    [_cinemaTableView registerNib:[UINib nibWithNibName:@"CinemaTableViewCell" bundle:nil] forCellReuseIdentifier:identify];

}

- (void)_loadData{
    
    NSDictionary *jsonDic = [LoadData requestData:@"district_list.json"];
    _data = [[NSMutableArray alloc] init];
    
    NSArray *arr = [jsonDic objectForKey:@"districtList"];
    
    for (NSDictionary *dic in arr) {
        Cinema *cinema = [[Cinema alloc] init];
        cinema.num = [dic objectForKey:@"id"];
        cinema.name = [dic objectForKey:@"name"];
       
        [_data addObject:cinema];
        
    }
    [_cinemaTableView reloadData];
}

- (void)_loadMovieData{

    NSDictionary *jsonDic = [LoadData requestData:@"cinema_list.json"];
    _MovieData = [[NSMutableArray alloc] init];
    
    _selectMovie = [[NSMutableArray alloc] init];
    
    NSArray *arr =[jsonDic objectForKey:@"cinemaList"];
    for (NSDictionary *dic in arr) {
        Cinema *cinema = [[Cinema alloc] init];
        cinema.name = [dic objectForKey:@"name"];
        cinema.num = [dic objectForKey:@"districtId"];
        cinema.set = [dic objectForKey:@"isSeatSupport"];
        cinema.coupon = [dic objectForKey:@"isSeatSupport"];
        cinema.circleName = [dic objectForKey:@"circleName"];
        cinema.lowPrice = [dic objectForKey:@"lowPrice"];
        cinema.grade = [dic objectForKey:@"grade"];
        cinema.isGroup = [dic objectForKey:@"isGroupBuySupport"];
        cinema.isImax = [dic objectForKey:@"isImaxSupport"];
        
        [_MovieData addObject:cinema];
        
    }
    [_cinemaTableView reloadData];
}
- (void)_select{
    Cinema *cinema =[[Cinema alloc] init];

    Cinema *cinema2 = [[Cinema alloc] init];
    
    for (Cinema *cinmea3 in _data) {
        cinema2.num = cinmea3.num;
        int b = [cinema2.num intValue];
       
        for (Cinema *cinmea4 in _MovieData) {
            cinema.num = cinmea4.num;
            int c = [cinema.num intValue];
            
            
            if (b == c) {
               
            }
            
        }
    }
   
   

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count;//这是组数,创建data个数的时候moviedata还没有
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Cinema *cin = [_data objectAtIndex:section];//取出在组里面各个人得数量
    int a = 0;
    
//    NSArray *arr = dic[@"id"];
    int b = [cin.num intValue];
    
    
    for (Cinema *cinmea4 in _MovieData) {
        Cinema *cinema2 = [[Cinema alloc] init];
        cinema2.num = cinmea4.num;
        int c = [cinema2.num intValue];
        
        
        if (b == c) {
            a++;
           
        }
        
    }
    
    BOOL f = _flag[section];//如果是关闭状态就为0
    
    if (f) {
        NSLog(@"%d",a);
        return a;
    }else
    {
        
        return 0;
    }
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 125;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    static NSString *identify = @"movieCell";
    //    USMovieCell *cell =[tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    for (NSInteger i = indexPath.section; i < _data.count; i++) {
        Cinema *cinema = [[Cinema alloc] init];
        
        cinema = _data[i];
        int a = [cinema.num intValue];
        _selectData = [[NSMutableArray alloc] init];
        for (NSInteger j = 0; j <_MovieData.count; j++) {
            Cinema *cinema2 = [[Cinema alloc] init];
            cinema2 = _MovieData[j];
            int b = [ cinema2.num intValue];
            if (a == b) {
                
                [_selectData addObject:_MovieData[j]];
                
            }
         
        }
       
     [_selectMovie addObject:_selectData];
       
    }
       cell.cinema = [[_selectMovie objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];

    cell.backgroundColor = [UIColor clearColor];
    
   
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;//给头视图一个高度
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    Cinema *cinema = [_data objectAtIndex:section];//这个位置上的所有信息取出来
    Cinema *cinema2 = [[Cinema alloc] init];
    cinema2.name = cinema.name;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.tag = section;
    [button setBackgroundImage:[UIImage imageNamed:@"btnbg_blue"]
                      forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"bg_main"]
                      forState:UIControlStateHighlighted];
    
    [button setTitle:cinema2.name forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    
    //    设置标题偏移，从原先的位置向右偏移220
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 220);
    
    return button;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buttonAction:(UIButton *)button {
    
    //    NSLog(@"%d",button.tag);
    
    NSInteger section = button.tag;
    
    _flag[section] = !_flag[section];
    
    
    //1.刷新所有的单元格
    //    [_tableView reloadData];
    
    //2.刷新指定的多个单元格
    //    [_tableView reloadRowsAtIndexPaths:<#(NSArray *)#>
    //                      withRowAnimation:<#(UITableViewRowAnimation)#>];
    
    //3.刷新多个组
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    
    //    NSRange rg = {0,3};
    //    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:rg];
    
    [_cinemaTableView reloadSections:indexSet
              withRowAnimation:UITableViewRowAnimationFade];
}

@end
