//
//  USMovieCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@interface USMovieCell : UITableViewCell
{
    __weak IBOutlet UIImageView *MyImage;

    __weak IBOutlet UILabel *racing;
    __weak IBOutlet UILabel *Title;
    __weak IBOutlet UIView *view;
    __weak IBOutlet UILabel *year;
}
@property (nonatomic,strong)Movie *movie;
@end
