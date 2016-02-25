//
//  PhotoCollectionView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/14.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "PhotoCollectionView.h"

#import "PhotoCell.h"
#import "MyScrollView.h"
static NSString *identify = @"PhotoCell";
@implementation PhotoCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置单元格大小
    flowLayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    
    flowLayout.minimumLineSpacing = NO;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        self.pagingEnabled = YES;
        //这是没有xib的注册方式
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:identify];
        
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _urls.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.url = self.urls[indexPath.row];
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *pCell = (PhotoCell *)cell;
    [pCell.scrollView setZoomScale:1];
    
}
@end
