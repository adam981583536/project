//
//  OldTable.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/11.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "OldTable.h"
#import "News.h"

@implementation OldTable

- (void)awakeFromNib {
    // Initialization code
}

-(void)setNews:(News *)news{
    _news = news;
    main.text = [NSString stringWithFormat:@"%@",news.title];
    main.font = [UIFont systemFontOfSize:15];
    other.text = [NSString stringWithFormat:@"%@",news.summary];
    other.font = [UIFont systemFontOfSize:13];
    NSString *medium = [NSString stringWithFormat:@"%@",news.image];
    NSURL *url = [NSURL URLWithString:medium];
    
    [mainImage sd_setImageWithURL:url];
    int num = [self.news.type intValue];
    
    if (num == 0) {
        otherView.hidden = YES;
        other.right = mainImage.right + 5;
    }
    
    if (num == 1) {
        otherView.hidden = NO;
        otherView.image = [UIImage imageNamed:@"sctpxw.png"];
        other.left = otherView.right + 5;
    }
    if (num == 2) {
        otherView.hidden = NO;
         otherView.image = [UIImage imageNamed:@"scspxw.png"];
        other.left = otherView.right + 5;
        
    }
}

@end
