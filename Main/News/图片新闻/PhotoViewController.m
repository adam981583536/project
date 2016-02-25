//
//  PhotoViewController.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *navigationBar =  self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    //样式设置为黑色
    navigationBar.barStyle = UIBarStyleBlack;
    //设置半透明
    navigationBar.translucent = YES;
    self.view.backgroundColor = [UIColor orangeColor];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];//新建一个按钮,一个是默认样式,这个是就一个字,模态视图进来的所以没有导航栏，push进来的才有，然后他是第一个导航栏所以没有
//模态视图本来是没有导航栏的，然后前面让他成为了父类导航栏的一个子类，和五个item是一个量级的,父类
    self.navigationItem.leftBarButtonItem = backItem;
    
    PhotoCollectionView *collectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:collectionView];
    
    collectionView.urls = _urls;
    
    [collectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    is_hidden = NO;
   
    
    //使用通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tap1:) name:@"tap1Notification" object:nil];
}


- (void)tap1:(NSNotification *)notification{
    
    is_hidden = !is_hidden;
    [self.navigationController setNavigationBarHidden:is_hidden animated:YES];
    
    //    [self prefersStatusBarHidden];
    //刷新状态栏的显示
    //    [self setNeedsStatusBarAppearanceUpdate];
    
    
}
- (BOOL)prefersStatusBarHidden
{
    return is_hidden;//状态栏的隐藏
    
}

- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
