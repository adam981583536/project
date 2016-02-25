//
//  PhotoCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyScrollView;
@interface PhotoCell : UICollectionViewCell
{
    MyScrollView *_scrollView;

}
@property (nonatomic, copy)NSString *url;
@property (nonatomic, strong)MyScrollView *scrollView;
@end
