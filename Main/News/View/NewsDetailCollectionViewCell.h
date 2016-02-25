//
//  NewsDetailCollectionViewCell.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/12.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsDetailCollectionViewCell : UICollectionViewCell
{

    __weak IBOutlet UIImageView *_image;
}
@property (nonatomic,strong)News *news;
@end
