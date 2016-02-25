//
//  MainMovieCollectionView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "MainMovieCollectionView.h"

@implementation MainMovieCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    
    self = [self initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        
        
        //实现代理
        self.delegate = self;
        self.dataSource = self;
        //设置scrollView减速的速度，范围是（0-1），默认是0，
        self.decelerationRate = 1;
        
        //        self.pagingEnabled = YES;
    }
    //左右偏移scrollView的
    //    self.contentInset = UIEdgeInsetsMake(0, 100, 0, 100);
    
    return self;
}

//返回单元格的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
    
}

#pragma mark - UIScrollView delegate
//手指离开屏幕的时候调用
/*
 scrollView
 velocity :加速度
 targetContentoffset :目标偏移量
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
    
    NSLog(@"%f", velocity.x);
    //    NSLog(@"当前偏移量:%f", scrollView.contentOffset.x);
    NSLog(@"目标偏移量:%f", targetContentOffset->x);
    //1、计算滑动停止之后，单元格位置的索引
    int index = (targetContentOffset->x + _pageWidth / 2 )/ _pageWidth;
    
    if (self.currentItem == index && index < self.data.count - 1) {
        //2、判断velocity滑动速度，速度快的话直接到下一页
        if (velocity.x > 0.5) {
            index++;
        }else if (velocity.x < -0.5 && index > 0){
            index--;
        }
    }
    //3、设置下一页的偏移量
    targetContentOffset->x = index * _pageWidth;
    //4、记录当前的显示页
    self.currentItem = index;
    
    
}
#pragma mark -UICollectionView delegate
//点击翻转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentItem != indexPath.item) {
        
        //让选中的单元格居中显示
        [UIView animateWithDuration:0.4 delay:0.0 options:0 animations:^{
            [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        } completion:NULL];
        //记录当前页
        self.currentItem = indexPath.item;
        
    }
    
    
}

//单元格左右偏移
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat offsetX = (CGRectGetWidth(self.frame) - _pageWidth) / 2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
    
}


@end
