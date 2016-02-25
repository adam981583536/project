//
//  NewsDetailController.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/12.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "NewsDetailController.h"
#import "UIView+WebCacheOperation.h"
@interface NewsDetailController ()

@end

@implementation NewsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"普通新闻";
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        //1、加载网络
//        NSURL *url = [NSURL URLWithString:@"http://www.youku.com"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        [webView loadRequest:request];
        [self.view addSubview:_webView];
    
    //    //2、加载本地的HTML的代码
    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"优酷" ofType:@"html"];
    //    NSString *s = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //    [webView loadHTMLString:s baseURL:nil];
    [self _loadData];
}
- (void)_loadData{

    NSDictionary *jsonData = [LoadData requestData:@"news_detail.json"];
    
    NSString *content = [jsonData objectForKey:@"content"];
    
    NSString *source = [jsonData objectForKey:@"source"];
    
    NSString *time = [jsonData objectForKey:@"time"];
    
    NSString *author = [jsonData objectForKey:@"author"];
    
    NSString *title = [jsonData objectForKey:@"title"];
    
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    
    NSString *html = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    //子标题  来源 时间
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@", source, time];
    //编辑（作者）
    NSString *at = [NSString stringWithFormat:@"(编辑:%@)", author];
    //拼接html文件
    NSString *htmlString = [NSString stringWithFormat:html, title, subTitle, content, at];
    
    [_webView loadHTMLString:htmlString baseURL:nil];
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    
    //创建加载视图
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_activityView stopAnimating];
    //    [_activityView startAnimating];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_activityView];
    self.navigationItem.rightBarButtonItem = rightItem;


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
