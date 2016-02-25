//
//  IndexCollectionView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/16.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "IndexCollectionView.h"
#import "Movie.h"
#import "IndexCell.h"
@implementation IndexCollectionView
{
    NSString *identify;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    //创建布局对象

    
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        identify = @"IndexCell";
        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:identify];
        //实现代理
     
        
        //        self.pagingEnabled = YES;
    }
    //左右偏移scrollView的
    //    self.contentInset = UIEdgeInsetsMake(0, 100, 0, 100);
    
    return self;
}

//返回单元格的尺寸


#pragma mark - UIScrollView delegate
//手指离开屏幕的时候调用
/*
 scrollView
 velocity :加速度
 targetContentoffset :目标偏移量
 */

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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    Movie *movie = self.data[indexPath.item];
    NSString *url = [movie.images objectForKey:@"medium"];
    cell.url = url;
    
    
    return cell;
}

@end
