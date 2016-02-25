//
//  MovieDetailView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "MovieDetailView.h"
#import "Movie.h"
#import "StartView.h"
@implementation MovieDetailView


- (void)setMovie:(Movie *)movie
{
    if (_movie != movie) {
        _movie = movie;
        
        //1、电影图片
        NSString *mediumUrl = [self.movie.images objectForKey:@"medium"];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:mediumUrl]];
        
        //2、电影标题
        _labelOne.text = [NSString stringWithFormat:@"中文:%@", _movie.title];
        
        //3、原标题
        _labelTwo.text = [NSString stringWithFormat:@"英文:%@", _movie.original_title];
        
        //4、年份
        _labelThree.text = [NSString stringWithFormat:@"年份:%@", _movie.year];
        
        //评分
        _racing.text = [NSString stringWithFormat:@"%.1f", [self.movie.average floatValue]];
        
        
        _starView.rating = [self.movie.average floatValue];
        
        
    }
}

@end
