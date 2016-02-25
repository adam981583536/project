//
//  NewsDetailCollectionViewCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/12.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "NewsDetailCollectionViewCell.h"
#import "News.h"
@implementation NewsDetailCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}
- (void)setNews:(News *)news{
    _news = news;
    
    NSURL *s =[NSURL URLWithString:self.news.image];
    [_image sd_setImageWithURL:s];
}
@end
