//
//  MovieDetailView.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StartView;
@class Movie;
@interface MovieDetailView : UIView
{

    __weak IBOutlet UIImageView *_imageView;

    __weak IBOutlet UILabel *_labelOne;

    __weak IBOutlet UILabel *_labelTwo;

    __weak IBOutlet UILabel *_labelThree;
    
    
    __weak IBOutlet StartView *_starView;
    
    __weak IBOutlet UILabel *_racing;
}
@property (nonatomic ,strong) Movie *movie;
@end
