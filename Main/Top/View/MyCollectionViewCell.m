//
//  MyCollectionViewCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/11.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "Top.h"
#import "StartView.h"
@implementation MyCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setTop:(Top *)top{
    
    _top = top;
    NSString *medium = [self.top.images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:medium];
    
    [_myImage sd_setImageWithURL:url];
    
    _title.text = self.top.name;
    _title.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    _title.font = [UIFont systemFontOfSize:13];
    _average.text = [NSString stringWithFormat:@"%0.1f",[self.top.average floatValue]];
    _average.font = [UIFont systemFontOfSize:11];
    
    
//    _title.textAlignment = NSTextAlignmentCenter;
    StartView *rating = [[StartView alloc] initWithFrame:CGRectMake(0, 0, 0, 14)];
    rating.rating = [top.average floatValue];
    [_star addSubview:rating];
}
@end
