//
//  IndexCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "IndexCell.h"

@implementation IndexCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建大图
        [self _createView];
        
    }
    return self;
}
- (void)_createView{
    //1、创建图片视图
    _imgView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    
    _imgView.backgroundColor = [UIColor redColor];
    
    _imgView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    
    [self.contentView addSubview:_imgView];
    
}

- (void)setUrl:(NSString *)url
{
    if (_url != url) {
        _url = url;
        
        //填充数据
        [_imgView sd_setImageWithURL:[NSURL URLWithString:url]];
        
    }
}
@end
