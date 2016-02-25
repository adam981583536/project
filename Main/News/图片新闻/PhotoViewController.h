//
//  PhotoViewController.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
{
    BOOL is_hidden;

}
@property (nonatomic, strong)NSArray *urls;
@property (nonatomic, strong)NSIndexPath *indexPath;
@end
