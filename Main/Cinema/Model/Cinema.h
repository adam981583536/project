//
//  Cinema.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cinema : NSObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,strong) NSNumber *num;
@property (nonatomic ,copy) NSString *circleName;
@property (nonatomic ,strong) NSNumber *lowPrice;
@property (nonatomic ,strong) NSNumber *grade;
@property (nonatomic ,strong) NSNumber *set;
@property (nonatomic ,strong) NSNumber *coupon;
@property (nonatomic ,strong) NSNumber *isImax;
@property (nonatomic ,strong) NSNumber *isGroup;
@end
