//
//  OneTableViewCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/11.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "OneTableViewCell.h"
#import "News.h"
@implementation OneTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setNews:(News *)news{
    _news = news;
    NSURL *s =[NSURL URLWithString:self.news.image];
    [main sd_setImageWithURL:s];
    
    title.text = self.news.title;
     title.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    
    title.font = [UIFont systemFontOfSize:15];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 向下拽了多少距离
    CGFloat down = -150 - scrollView.contentOffset.y;
    if (down < 0) return;
    
    CGRect frame = main.frame;
    
    // 5决定图片变大的速度,值越大,速度越快
    frame.size.height = 150 + down * 5;
    main.frame = frame;
}
@end
