//
//  OldTable.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/11.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface OldTable : UITableViewCell
{

    __weak IBOutlet UIImageView *mainImage;
   
    __weak IBOutlet UIImageView *otherView;
    __weak IBOutlet UILabel *main;
    __weak IBOutlet UILabel *other;
}
@property (nonatomic,strong)News *news;
@end
