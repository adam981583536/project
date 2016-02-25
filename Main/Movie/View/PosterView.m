//
//  PosterView.m
//  项目1吗
//
//  Created by 汇文教育 on 15/12/15.
//  Copyright © 2015年 李小红和绿小明. All rights reserved.
//

#import "PosterView.h"
#import "IndexCollectionView.h"
#import "PostCollectionView.h"
#import "Movie.h"
#define kFooterViewHeight 35
#define kHeaderHeight 100
@implementation PosterView{
    //半透明遮盖视图
    UIControl *_maskView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
        [self _creatHeardView];
        
        [self _creatPostView];
        //3、创建索引海报视图
        [self _createIndexCollectionView];
        
        
        [self _creatFooterView];
        
        [_posterCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        [_indexCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
   
        
        
        
    }
    return self;
}

#pragma KVO 观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"currentItem"]) {
        NSNumber *newValue = [change objectForKey:@"new"];
        NSInteger item = [newValue integerValue];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        
        //把值赋给小图的currentItem
        
        if (object == _posterCollectionView && _indexCollectionView.currentItem != _posterCollectionView.currentItem) {
            _indexCollectionView.currentItem = item;
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            [_indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        else if (object == _indexCollectionView&& _indexCollectionView.currentItem != _posterCollectionView.currentItem){
            _posterCollectionView.currentItem = item;
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            [_posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        
        }
        Movie *movie = self.data[item];
        _footLabel.text = movie.title;
        
    }


}


- (void)_creatFooterView{

    _footLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - kFooterViewHeight - 49, kScreenWidth, kFooterViewHeight)];
    _footLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home.png"]];
    _footLabel.font = [UIFont systemFontOfSize:16];
    _footLabel.textColor = [UIColor whiteColor];
    _footLabel.textAlignment = NSTextAlignmentCenter;
    _footLabel.text = @"电影";
    [self addSubview:_footLabel];

}

- (void)_creatHeardView{
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image =[image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    
    _heardView =[[UIView alloc] initWithFrame:CGRectMake(0,  64 - kHeaderHeight, kScreenWidth, 130)];
    _heardView.backgroundColor = [UIColor redColor];
    [self addSubview:_heardView ];
    
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
    imageView.image = image;
    
    [_heardView addSubview:imageView];
    _heardView.backgroundColor = [UIColor clearColor];
   
    
    UIButton *downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake((kScreenWidth - 10) / 2, 130 - 20, 15, 15);
    [downButton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [downButton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    downButton.tag = 100;
    
    [downButton addTarget:self action:@selector(arrowsAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [_heardView addSubview:downButton];
    //创建向下轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swipe];
}
- (void)_creatPostView{

    
    _posterCollectionView = [[PostCollectionView alloc] initWithFrame:CGRectMake(0, 30 + 64, kScreenWidth, self.height - 30 - kFooterViewHeight - 64 - 49)];
    _posterCollectionView.backgroundColor = [UIColor clearColor];
    _posterCollectionView.pageWidth = 220;
    
    [self insertSubview:_posterCollectionView belowSubview:_heardView];
    

}
- (void)_createIndexCollectionView{
    _indexCollectionView = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeaderHeight)];
    _indexCollectionView.pageWidth = 75;
    [_heardView addSubview:_indexCollectionView];
    
}
- (void)swipe:(UISwipeGestureRecognizer *)swipe{

    [self _showHeaderView];
}


- (void)arrowsAction:(UIButton *)button{
    //显示、隐藏
    if (button.selected == NO) {
        //加动画效果
        [self _showHeaderView];
        
    }else{
        
        [self _hideHeaderView];
        
    }
    
}
- (void)_showHeaderView{
    [UIView animateWithDuration:0.4 animations:^{
        _heardView.transform = CGAffineTransformMakeTranslation(0, kHeaderHeight);
    }];
    if (_maskView == nil) {
        //创建半透明视图
        _maskView = [[UIControl alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [_maskView addTarget:self action:@selector(maskAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self insertSubview:_maskView belowSubview:_heardView];
    }
    _maskView.hidden = NO;
    
    UIButton *backeButton =(UIButton *)[_heardView viewWithTag:100];
    backeButton.selected = YES;
}

- (void)_hideHeaderView{
    [UIView animateWithDuration:0.4 animations:^{
        
        _heardView.transform = CGAffineTransformIdentity;
    }];
    _maskView.hidden = YES;
    
    //2、修改按钮的状态
    UIButton *arrowsButton = (UIButton *)[_heardView viewWithTag:100];
    arrowsButton.selected = NO;
    
    
}
- (void)maskAction:(UIControl *)control{
    [self _hideHeaderView];

}
- (void)setData:(NSArray *)data{
    if (_data != data) {
        _data = data;
        [_posterCollectionView setData:_data];
        
        [_indexCollectionView setData:_data];
        if (data.count > 0) {
            Movie *movie = [data objectAtIndex:0];
            _footLabel.text = movie.title;
        }
        
    }

}
@end
