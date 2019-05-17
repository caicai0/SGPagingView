//
//  SGPageContentCollectionView+mutable.m
//  SGPagingViewExample
//
//  Created by liyufeng on 2019/5/16.
//  Copyright © 2019 Sorgle. All rights reserved.
//

#import "SGPageContentCollectionView+mutable.h"

@interface SGPageContentCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate>
/// 存储子控制器
@property (nonatomic, strong) NSArray *childViewControllers;
/// collectionView
@property (nonatomic, strong) UICollectionView *collectionView;
/// 记录加载的上个子控制器的下标
@property (nonatomic, assign) NSInteger previousCVCIndex;

- (void)P_layoutSubviews;

@end

@implementation SGPageContentCollectionView (mutable)

- (void)resetChildVCs:(NSArray *)childVCs;{
    self.childViewControllers = childVCs;
    [self P_layoutSubviews];
    if (self.previousCVCIndex >= self.childViewControllers.count) {
        [self setPageContentCollectionViewCurrentIndex:0];
    }else{
        [self scrollViewDidEndDecelerating:self.collectionView];
    }
}

@end
