//
//  News.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/11.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, strong) NSNumber* newsId;
@end
