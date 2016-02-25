//
//  TopViewController.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "TopViewController.h"
#import "Top.h"
#import "MyCollectionViewCell.h"
#import "TopView.h"
static NSString *identify = @"cell";
@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self _ceratCollerction];
//    [self _ceratCollerction];
   
    [self _ceratCollerction];
    [self _loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)_loadData{
    NSDictionary *jsobDic =[LoadData requestData:@"top250.json"];
    _data = [[NSMutableArray alloc] init];
    NSArray *arr = [jsobDic objectForKey:@"subjects"];
    for (NSDictionary *dic in arr) {
      
        Top *top = [[Top alloc] init];
        top.average = [[dic objectForKey:@"rating"]objectForKey:@"average"];
        
        top.images = [dic objectForKey:@"images"];
        
        top.name = [dic objectForKey:@"title"];
        
        [_data addObject:top];
        
    }
    [_collectionView reloadData];
}
- (void)_ceratCollerction{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
//    flowLayout.itemSize = CGSizeMake(100, 100);
     _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-110) collectionViewLayout:flowLayout];
   
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identify];
   
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
//    _collectionView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:_collectionView];
}
#pragma mark - Navigation
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _data.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.top = _data[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor purpleColor];
    return cell;
   
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(kScreenWidth/3-10, 150);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TopView *table = [[TopView alloc] init];
    [self.navigationController pushViewController:table animated:YES];
    
}

@end
