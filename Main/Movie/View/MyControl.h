//
//  MyControl.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/8.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyControl : UIControl
//重写控制器样式,只是说在这里面定制他样式，大小已经给定了
- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)image withTitle:(NSString *)title;
@end
