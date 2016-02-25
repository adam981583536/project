//
//  PosterCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/15.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "PosterCell.h"
#import "Movie.h"
#import "MovieDetailView.h"
@implementation PosterCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建大图
        [self _createView];
        
    }
    return self;
}
- (void)_createView{
    //1、创建图片视图
    
    left = YES;
  
    
    _imgView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    
    _imgView.backgroundColor = [UIColor redColor];
    
    _imgView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    
   [self.contentView addSubview:_imgView];
    
    redView = [[MovieDetailView alloc] initWithFrame:self.contentView.bounds];
    redView.backgroundColor =[UIColor redColor];
    redView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    redView = [[[NSBundle mainBundle]loadNibNamed:@"MovieDetilView" owner:self options:nil]lastObject];
    
    [self.contentView insertSubview:redView belowSubview:_imgView];
}

- (void)setMovie:(Movie *)movie
{
    if (_movie != movie) {
        _movie = movie;
        
        //填充数据
        NSString *largeUrl = [movie.images objectForKey:@"large"];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:largeUrl]];
        [redView setMovie:movie];
        
    }
}
- (void)flipCell{
    UIViewAnimationOptions transtion = left ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    
    NSInteger index1 = [self.contentView.subviews indexOfObject:_imgView];
    NSInteger index2 = [self.contentView.subviews indexOfObject:redView];
    
    [UIView transitionWithView:self.contentView duration:0.5 options:transtion animations:^{
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        
    } completion:NULL];
    
    left = !left;
    _isFlip = !_isFlip;
}

@end
