//
//  SGPageContentScrollView+multable.m
//  SGPagingViewExample
//
//  Created by liyufeng on 2019/5/16.
//  Copyright © 2019 Sorgle. All rights reserved.
//

#import "SGPageContentScrollView+multable.h"

@interface SGPageContentScrollView()<UIScrollViewDelegate>
/// 存储子控制器
@property (nonatomic, strong) NSArray *childViewControllers;
/// scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
/// 记录加载的上个子控制器的下标
@property (nonatomic, assign) NSInteger previousCVCIndex;

- (void)P_layoutSubviews;

@end

@implementation SGPageContentScrollView (multable)

- (void)resetChildVCs:(NSArray *)childVCs;{
    self.childViewControllers = childVCs;
    [self P_layoutSubviews];
    if (self.previousCVCIndex >= self.childViewControllers.count) {
        [self setPageContentScrollViewCurrentIndex:0];
    }else{
        [self scrollViewDidEndDecelerating:self.scrollView];
    }
}

@end
