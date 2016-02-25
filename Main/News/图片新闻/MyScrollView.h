//
//  MyScrollView.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageView;

}
@property (nonatomic ,strong) NSURL *url;
@end
