//
//  ImageNewsViewController.h
//  项目1吗
//
//  Created by 汇文教育 on 15/12/12.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "BaseViewController.h"

@interface ImageNewsViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
   
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *data;
@end
