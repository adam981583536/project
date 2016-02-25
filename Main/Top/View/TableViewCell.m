//
//  TableViewCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "TableViewCell.h"
#import "Top.h"
@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setTop:(Top *)top{
    if (_top != top) {
        _top = top;
        [_image sd_setImageWithURL:[NSURL URLWithString:self.top.image]];
        
        _name.text = self.top.titleCn;
        _name.textColor = [UIColor yellowColor];
        NSString *d = @"";
        for (NSString *s in self.top.directors) {
            _actor.text = s;
        }
        for (NSString *s in self.top.actors) {
            NSString *z = s;
            
            if ([z isEqualToString:@"凤姐"]) {
                d = [d stringByAppendingFormat:@"%@",z];
            }else{
            d = [d stringByAppendingFormat:@"%@,",z];
            }
            
        }
      
        _actor2.text = d;
        
        NSString *s = [self.top.time objectForKey:@"location"];
        NSString *s1 = [self.top.time objectForKey:@"date"];
       s = [s stringByAppendingFormat:@" %@",s1];
      
        _from.text = s;
        
        for (int i = 0; i < self.top.Videos.count; i ++) {
            if (i == 0) {
                NSDictionary *hah = [self.top.Videos objectAtIndex:i];
                NSString *hhhh = [hah objectForKey:@"image"];
                
                [_image1 sd_setImageWithURL:[NSURL URLWithString:hhhh]];
            }
            if (i == 1) {
                NSDictionary *hah = [self.top.Videos objectAtIndex:i];
                NSString *hhhh = [hah objectForKey:@"image"];
                
                [_image2 sd_setImageWithURL:[NSURL URLWithString:hhhh]];
            }
            if (i == 2) {
                NSDictionary *hah = [self.top.Videos objectAtIndex:i];
                NSString *hhhh = [hah objectForKey:@"image"];
                
                [_image3 sd_setImageWithURL:[NSURL URLWithString:hhhh]];
            }
            if (i == 3) {
                NSDictionary *hah = [self.top.Videos objectAtIndex:i];
                NSString *hhhh = [hah objectForKey:@"image"];
                
                [_image4 sd_setImageWithURL:[NSURL URLWithString:hhhh]];
            }
        }
        
    }
    

}



@end
