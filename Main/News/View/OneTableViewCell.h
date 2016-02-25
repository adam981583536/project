//
//  OneTableViewCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/11.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface OneTableViewCell : UITableViewCell
{

    __weak IBOutlet UIImageView *main;
    __weak IBOutlet UILabel *title;
}
@property (nonatomic,strong) News* news;
@end
