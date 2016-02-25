//
//  TopTableViewCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Top;
@interface TopTableViewCell : UITableViewCell
{

    __weak IBOutlet UIImageView *_image;

    __weak IBOutlet UILabel *_name;
    
    __weak IBOutlet UILabel *_comment;
    __weak IBOutlet UILabel *_racing;
}
@property (nonatomic,strong) Top *top;
@end
