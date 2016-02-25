//
//  CinemaTableViewCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Cinema;
@interface CinemaTableViewCell : UITableViewCell

{
    __weak IBOutlet UILabel *_address;

//    __weak IBOutlet UILabel *_low;
    __weak IBOutlet UILabel *_cinemaName;
    
   

    __weak IBOutlet UILabel *_cinemaScore;
    
    

    __weak IBOutlet UILabel *_lowPrice;
    
    
    __weak IBOutlet UILabel *_set;
    
    __weak IBOutlet UILabel *_group;
    
    __weak IBOutlet UIView *_seat;
    
    __weak IBOutlet UIView *_isgroup;
    
    
    
    
}
@property (nonatomic,strong)Cinema *cinema;
@end
