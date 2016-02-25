//
//  ImageNewsViewController.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/12.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "ImageNewsViewController.h"
#import "News.h"
#import "NewsDetailCollectionViewCell.h"
#import "News.h"
#import "PhotoViewController.h"
#import "MyNavigationViewController.h"
#import "ImageNewsViewController.h"
static NSString *identify = @"cell";
@interface ImageNewsViewController ()

@end

@implementation ImageNewsViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarController.tabBar.hidden = YES;//Int的时候无法消除
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图片新闻";
    
 
    [self _creatCellView];
    
    [self _loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_creatCellView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    //    flowLayout.itemSize = CGSizeMake(100, 100);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:flowLayout];
//    
    [_collectionView registerNib:[UINib nibWithNibName:@"NewsDetailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identify];
//
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    //    _collectionView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:_collectionView];

}

- (void)_loadData{

    NSArray *jsobDic =[LoadData requestData:@"image_list.json"];
    _data = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in jsobDic) {
        
        News *top = [[News alloc] init];
       
        
        top.image = [dic objectForKey:@"image"];
       
        
        
        [_data addObject:top];
        
        
    }
    [_collectionView reloadData];
}

#pragma mark - Navigation
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectireon{
    return _data.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NewsDetailCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.news = _data[indexPath.row];
    
    
    //    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(70, 70);
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *urls = [NSMutableArray array];//新建一个可变数组储存地址
    for (News *model in self.data) {//把data里面的东西挨个给model
        NSString *urlString = model.image;//然后从Model里面取出地址
        [urls addObject:urlString];//把地址给可变数组
        
    }
    /*
     通过模态视图弹出控制器，此控制器是直接被添加到window上面的，没有父类控制器
     */
    PhotoViewController *photoCtrl = [[PhotoViewController alloc] init];
    //把photoCtrl作为第一个子控制器
    MyNavigationViewController *navigation = [[MyNavigationViewController alloc] initWithRootViewController:photoCtrl];//这句话是创建一个父类的导航栏？什么意思//把这个photoCtrl成为父类导航栏的一个子类导航栏，使他们两个有联系添加根视图控制器，最先显示。
    
    [self presentViewController:navigation animated:YES completion:NULL];//模态视图
    
    photoCtrl.urls = urls;//poheot的地址是urls
    
    
    photoCtrl.indexPath = indexPath;//photoController的下标数等于这个的indexpath
    
}

@end
