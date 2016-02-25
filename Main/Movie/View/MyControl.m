//
//  MyControl.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/8.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "MyControl.h"

@implementation MyControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)image withTitle:(NSString *)title;
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 20) / 2, 5, 20, 20)];
        imgView.image = [UIImage imageNamed:image];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imgView];//添加到这个controller上
        
        //2）创建标题视图
        //getMaxY表示拿到imgView的y方向的最大值
        CGFloat maxY = CGRectGetMaxY(imgView.frame);//添加在最下面
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, maxY, frame.size.width, 20)];
        titleLabel.text = title;
        titleLabel.textAlignment = NSTextAlignmentCenter;//居中
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:11];
        
        [self addSubview:titleLabel];
        

        
        
    }
    return self;
}
@end
