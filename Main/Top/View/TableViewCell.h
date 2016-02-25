//
//  TableViewCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  Top;
@interface TableViewCell : UITableViewCell
{

    __weak IBOutlet UIImageView *_image;
    __weak IBOutlet UILabel *_name;
    
    __weak IBOutlet UILabel *_actor;
    
    __weak IBOutlet UILabel *_actor2;
    
  
    
    
    __weak IBOutlet UILabel *_from;
    
    __weak IBOutlet UIImageView *_image1;
    __weak IBOutlet UIImageView *_image2;
    __weak IBOutlet UIImageView *_image3;
    __weak IBOutlet UIImageView *_image4;
}
@property (nonatomic ,strong) Top *top;
@end
