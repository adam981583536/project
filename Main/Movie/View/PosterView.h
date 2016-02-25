//
//  PosterView.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/15.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PostCollectionView;
@class IndexCollectionView;
@interface PosterView : UIView

{
        UIView *_heardView;
    
        PostCollectionView *_posterCollectionView;
        IndexCollectionView *_indexCollectionView;
    
    //尾部视图
        UILabel *_footLabel;
}
@property (nonatomic ,copy)NSArray *data;
@end
