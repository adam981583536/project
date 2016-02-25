//
//  MyCollectionViewCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/11.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Top;
@class StartView;
@interface MyCollectionViewCell : UICollectionViewCell

{
    __weak IBOutlet UILabel *_average;

    __weak IBOutlet UIImageView *_myImage;
    
    __weak IBOutlet UILabel *_title;
    
  
    __weak IBOutlet UIView *_star;
    
}
@property (nonatomic,strong) Top *top;
@end
