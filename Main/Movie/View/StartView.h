//
//  StartView.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/10.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartView : UIView
{
    UIView *_yellow;
    UIView *_gray;

}
@property (nonatomic,assign) CGFloat rating;
//CGFloat is just a typedef for either float or double.
//typedef float CGFloat;// 32-bit
//typedef double CGFloat;// 64-bit
//对于需要兼容64位机器的程序而言，需要用CGFloat，当然从长远角度考虑还是推荐尽量使用CGFloat。尽管在32位上相比float增加了一些memory footprint的消耗cgfloat是兼容64机器的
@end
