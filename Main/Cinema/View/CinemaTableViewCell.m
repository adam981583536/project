//
//  CinemaTableViewCell.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "CinemaTableViewCell.h"
#import "Cinema.h"
@implementation CinemaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setCinema:(Cinema *)cinema{
    if (_cinema != cinema) {
        _cinema = cinema;
       
        _cinemaName.text = self.cinema.name;
        
        if ([cinema.circleName isEqual:[NSNull null]]) {
            _address.text = @"倒闭了";
            
        }else{
            _address.text = _cinema.circleName;
        
        }
        
        if ([cinema.lowPrice isEqual:[NSNull null]]) {
           _lowPrice.text = @"破产了";
        }
        else{
            
            _lowPrice.text = [NSString stringWithFormat:@"%.1f", [self.cinema.lowPrice floatValue]];
        }
        
      
        
        _cinemaScore.text  = [NSString stringWithFormat:@"%.1f", [self.cinema.grade floatValue]];
//        
//        _lowPrice.text = [NSString stringWithFormat:@"%.1f", [self.cinema.lowPrice floatValue]];
        int numSet = [self.cinema.set intValue];
        int numCoupon = [self.cinema.coupon intValue];
        int numImax = [self.cinema.isImax intValue];
        int numGroup = [self.cinema.isGroup intValue];
//        
        if (numSet == 1) {
            _set.text = @"站票";
            _set.hidden = NO;
      }
        if (numSet == 0) {
            _set.hidden = YES;
        }
//        
        if (numCoupon == 1) {
            _group.text = @"坐票";
            _group.hidden = NO;
        }
        
        if (numCoupon == 0) {
            _group.text = @"坐票";
            _group.hidden = YES;
        }
        if (numImax == 0) {
            _isgroup.hidden = YES;
        }
        if (numImax == 1) {
            _isgroup.hidden = NO;
            
        }
        
        if (numGroup == 0) {
            _seat.hidden = YES;
        }
        if (numGroup == 1) {
            _seat.hidden = NO;
            
        }
    }

}


@end
