//
//  Movie.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property (nonatomic, strong)NSNumber *average; //评分
@property (nonatomic, copy)NSString *title; //标题
@property (nonatomic, copy)NSString *original_title; //原标题
@property (nonatomic, copy)NSString *subtype; //种类
@property (nonatomic, copy)NSString *year; //年份
@property (nonatomic, copy)NSDictionary *images; //images
@property (nonatomic, copy)NSString *movieID; //电影ID
@property (nonatomic, strong)NSNumber *collect_count; //收藏人数


@end
