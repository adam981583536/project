//
//  MainMovieCollectionView.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMovieCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign)CGFloat pageWidth; //一页的宽度
@property (nonatomic ,copy)NSArray *data;
@property (nonatomic, assign) NSInteger currentItem;

@end
