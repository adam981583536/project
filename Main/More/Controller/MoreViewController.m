//
//  MoreViewController.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    self.tableView.separatorColor = [UIColor darkGrayColor];
    
    
    
    
    //打印沙盒的路径
    //    NSLog(@"%@", NSHomeDirectory());
    //
    //    //先找出后缀地址
    //    NSString *cachePath = @"Library/Caches/com.hackemist.SDWebImageCache.default";
    //    //拼接到沙盒的路径上去
    //    NSString *fullPath = [NSHomeDirectory() stringByAppendingPathComponent:cachePath];
    //
    //    NSLog(@"%@", fullPath);
    //
    //    //文件初始化
    //    NSFileManager *fileManager = [NSFileManager defaultManager];
    //    //移除文件夹
    //    [fileManager removeItemAtPath:fullPath error:nil];
    //
}
- (void)countCacheSize{
    NSUInteger fileSize = [[SDImageCache sharedImageCache] getSize];
    _memory.text = [NSString stringWithFormat:@"%.1f M", fileSize / 1024 / 1024.0];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self countCacheSize];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"清空缓存" message:@"确实要清空缓存吗？" preferredStyle:UIAlertControllerStyleAlert];
        
        
         
         [alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:^{
               
            }];
        }]];
        [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[SDImageCache sharedImageCache] clearDisk];
            [self countCacheSize];
        }]];        
        
        [self presentViewController:alertView animated:YES completion:NULL];
        
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[SDImageCache sharedImageCache] clearDisk];
        [self countCacheSize];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
