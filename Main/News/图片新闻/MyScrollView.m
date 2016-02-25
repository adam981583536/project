//
//  MyScrollView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
        
        //1、设置缩放的最大、最小倍数
        self.maximumZoomScale = 3.0;
        self.minimumZoomScale = 1.0;
        
        //2、隐藏滚动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        self.delegate = self;
        
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        //创建点击手势对象
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2:)];
        //设置点击次数
        tap2.numberOfTapsRequired = 2;
        //设置触摸手指的数量
        //        tap2.numberOfTouchesRequired = 2;
        /*
         轻扫
         UIPanGestureRecognizer
         捏合
         UIPinchGestureRecognizer
         长按
         UILongPressGestureRecognizer
         */
       
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1:)];
        [self addGestureRecognizer:tap1];
        
        [self addGestureRecognizer:tap2];
       
        [tap1 requireGestureRecognizerToFail:tap2];//当要进行tap1消耗的时候使tap2无效化 
    }
    return self;
}
- (void)tap1:(UITapGestureRecognizer *)tap1{
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tap1Notification" object:self];
    
}
- (void)tap2:(UITapGestureRecognizer *)tap2{
    //    NSLog(@"点击了");
    //手势作用的视图对象
    //    NSLog(@"%@", tap2.view);
    //zoomScale表示子视图缩放的倍数
    if (self.zoomScale > 1) {
        [self setZoomScale:1 animated:YES];
        
    }else{
        
        [self setZoomScale:3 animated:YES];
    }
    
}

- (void)setUrl:(NSURL *)url
{
    if (_url != url) {
        _url = url;
        
        //加载图片
        [_imageView sd_setImageWithURL:url];
        
    }
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
    
}
@end
