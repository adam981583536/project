//
//  TopTableViewCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "TopTableViewCell.h"
#import "Top.h"
#import "TopVIew.h"
@implementation TopTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setTop:(Top *)top{
    if (_top != top) {
        _top = top;
        [_image sd_setImageWithURL:[NSURL URLWithString:_top.userImage]];
        
        _name.text = top.nickname;
        _racing.text = [NSString stringWithFormat:@"%d",[self.top.rating intValue]];
        _comment.text = top.content;
        
    }
    
}

@end
