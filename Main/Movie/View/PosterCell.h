//
//  PosterCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/15.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class MovieDetailView;
@interface PosterCell : UICollectionViewCell
{
    UIImageView *_imgView;
    BOOL left;
    MovieDetailView *redView;
}
@property (nonatomic ,strong) Movie *movie;
@property (nonatomic, assign) BOOL isFlip;
- (void)flipCell;




@end
