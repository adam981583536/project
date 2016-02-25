//
//  NewsDetailController.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/12.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsDetailController : BaseViewController<UIWebViewDelegate>

{
    UIWebView *_webView;
    
    UIActivityIndicatorView *_activityView;
    
}


@end
