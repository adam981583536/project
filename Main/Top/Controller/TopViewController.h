//
//  TopViewController.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/9.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    NSMutableArray *_data;

   
}

@property (nonatomic, strong) UICollectionView *collectionView;
@end
