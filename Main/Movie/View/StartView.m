
//
//  StartView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/10.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "StartView.h"

@implementation StartView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _creatView];
    }
    return self;//
}

- (void)awakeFromNib{
    [self _creatView];
 
 }
- (void)_creatView{
    UIImage *yellow = [UIImage imageNamed:@"yellow"];
    UIImage *gray = [UIImage imageNamed:@"gray"];
    
    // Do any additional setup after loading the view.
    //    CGFloat x = 20;
    //    CGFloat y = 100;
    //
    //    UIImage *img = [UIImage imageNamed:@"yellow"];//导入一个图形
    //
    //    UIView *str = [[UIView alloc] initWithFrame:CGRectMake(x, y, img.size.width*5, img
    //                                                       .size.height)];//这只是单纯地扩大frame
    //    str.backgroundColor = [UIColor colorWithPatternImage:img];//背景里面放图片，就是如果图片的大小不够就增加图片数量直到填满
    //
    //    str.transform = CGAffineTransformMakeScale(2, 2);//长宽扩大两倍
    //    CGRect frame = str.frame;//拿出现在图像背后的那个框吧
    //    frame.origin = CGPointMake(x, y);//然后让现在图像的源位置变为x,y
    //    str.frame = frame;//然后把图像放进那个框里面
    _gray = [[UIView alloc] initWithFrame:CGRectMake(0, 0, yellow.size.width*5, yellow.size.height)];
    _gray.backgroundColor = [UIColor colorWithPatternImage:gray];
    [self addSubview:_gray];

    
    _yellow = [[UIView alloc] initWithFrame:CGRectMake(0, 0, yellow.size.width*5, yellow.size.height)];
    _yellow.backgroundColor = [UIColor colorWithPatternImage:yellow];
    [self addSubview:_yellow];
    
    CGFloat star5Width = self.frame.size.height * 5;//五个星星的宽度，
    //这一步才是最关键的让他的frame的宽度不可改变，始终达到填充满地大小
    CGRect frame = self.frame;//就是说由外面给的那个容器的大小
    frame.size.width = star5Width;//自身容器大小为五个星星的宽度
    self.frame = frame;//应该说这一步才是给frame范围，宽度给固定了是五个星星大小，要填充满//这是固定宽度
    //为什么是高度的倍数？，因为宽度固定只有高度由父类传入
    CGFloat t = self.frame.size.height/_yellow.frame.size.height;
    CGAffineTransform tt = CGAffineTransformMakeScale(t, t);
    _yellow.transform = tt;
    _gray.transform = tt;
    
    CGRect f1 = _gray.frame;
    CGRect f2 = _yellow.frame;
    f1.origin = CGPointZero;
    f2.origin = CGPointZero;
    
    _yellow.frame = f1;//图像放大倍数
    _gray.frame = f2;
   
}
- (void)setRating:(CGFloat)rating{
    _rating = rating;
    
    //1、计算分数的百分比
    CGFloat s = rating / 10.0;
    
    CGFloat width = self.frame.size.width * s;//黄色星星显示的大小，给黄星星显示的范围
    
    CGRect frame = _yellow.frame;//这是总的黄星星的大小
    frame.size.width = width;//然后把要缩小的黄星星的大小给它，就是总的那个
    _yellow.frame = frame;//然后就给成了，都要通过中间变量来给
    
    //   _yellowView.frame.size.width = self.frame.size.width * s;网上的说法是_yellow.frame是消息的传递
    //后面的则是oc里的点语法会变成getframe().size.height最后就是一个常量无法被赋值，要先用一个中间CGRCt

}
@end
