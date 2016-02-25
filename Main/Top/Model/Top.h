//
//  Top.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/11.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Top : NSObject
@property (nonatomic, strong)NSNumber *average;
@property (nonatomic, copy)NSDictionary *images;
@property (nonatomic, strong)NSNumber *image_id;
@property (nonatomic, copy)NSString *name;
@property (nonatomic , copy) NSString *image;
@property (nonatomic , copy) NSString *titleCn;
@property (nonatomic , strong) NSMutableArray *Videos;
@property (nonatomic , strong) NSMutableDictionary *time;
@property (nonatomic ,strong) NSMutableArray *actors;
@property (nonatomic ,strong) NSMutableArray *directors;
@property (nonatomic ,strong) NSString *type;
@property (nonatomic ,strong) NSString *userImage;
@property (nonatomic ,strong) NSString *nickname;
@property (nonatomic ,strong) NSNumber *rating;
@property (nonatomic ,strong) NSString *content;
@end
