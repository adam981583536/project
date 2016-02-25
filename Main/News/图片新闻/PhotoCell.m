//
//  PhotoCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "PhotoCell.h"
#import "MyScrollView.h"
@implementation PhotoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[MyScrollView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_scrollView];
       
    }
    return self;
}
-(void)setUrl:(NSString *)url{
    
    if (_url != url) {
        _url = url;
        
        _scrollView.url = [NSURL URLWithString:url];
    }

}

@end
