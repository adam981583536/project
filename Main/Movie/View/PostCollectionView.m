//
//  PostCollectionView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/15.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "PostCollectionView.h"
#import "PosterCell.h"
@implementation PostCollectionView

{
    NSString *identify;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame ];
    if (self) {
        
        
        identify = @"PosterCell";
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:identify];
        
      
        
    }
    //左右偏移scrollView的
    //    self.contentInset = UIEdgeInsetsMake(0, 100, 0, 100);
    return self;
}
//返回单元格的尺寸

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([(PosterCell *)cell isFlip] == 1) {
        [(PosterCell *)cell flipCell];
    }
    
    
}



#pragma mark -UICollectionView delegate


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    cell.movie = self.data[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //【单元格 翻转】
    if (self.currentItem == indexPath.item) {
        
        //【单元格 翻转】
        PosterCell *pCell =  (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [pCell flipCell];
        
    }else{
        //让选中的单元格居中显示
        [UIView animateWithDuration:0.4 delay:0.0 options:0 animations:^{
            [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        } completion:NULL];
        //记录当前页
        self.currentItem = indexPath.item;
        
    }
    
}
@end
