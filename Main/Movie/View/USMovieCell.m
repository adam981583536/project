//
//  USMovieCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "USMovieCell.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"
#import "MovieController.h"
#import "StartView.h"
@implementation USMovieCell

- (void)awakeFromNib {
    // Initialization code
    
   
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
- (void)setMovie:(Movie *)movie
{
    
    
    _movie = movie;
    
    Title.text = self.movie.title;
    
    year.text = [NSString stringWithFormat:@"年份:%@", self.movie.year];
    racing.text = [NSString stringWithFormat:@"%.1f", [self.movie.average floatValue]];
    year.font = [UIFont systemFontOfSize:15];
    
    NSString *medium = [self.movie.images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:medium];
    
    [MyImage sd_setImageWithURL:url];
//
    StartView *rating = [[StartView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    rating.rating = [movie.average floatValue];
    [view addSubview:rating];
//
}
@end
