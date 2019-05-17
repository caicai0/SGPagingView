//
//  SGPageTitleView+multable.m
//  SGPagingViewExample
//
//  Created by liyufeng on 2019/5/16.
//  Copyright © 2019 Sorgle. All rights reserved.
//

#import "SGPageTitleView+multable.h"

@interface SGPageTitleView ()
/// 保存外界传递过来的标题数组
@property (nonatomic, strong) NSArray *titleArr;
/// 存储标题按钮的数组
@property (nonatomic, strong) NSMutableArray *btnMArr;
/// 存储标题按钮间分割线的数组
@property (nonatomic, strong) NSMutableArray *VSeparatorMArr;
/// 记录所有按钮文字宽度
@property (nonatomic, assign) CGFloat allBtnTextWidth;
/// 标记按钮下标
@property (nonatomic, assign) NSInteger signBtnIndex;

- (void)setupTitleButtons;
- (void)P_layoutSubviews;

@end

@implementation SGPageTitleView (multable)

- (void)resetTitleNames:(NSArray *)titleNames{
    self.titleArr = titleNames;
    [self.btnMArr enumerateObjectsUsingBlock:^(UIView*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.btnMArr removeAllObjects];
    
    [self.VSeparatorMArr enumerateObjectsUsingBlock:^(UIView*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.VSeparatorMArr removeAllObjects];
    
    self.allBtnTextWidth = 0;
    [self setupTitleButtons];
    [self P_layoutSubviews];
    if (self.signBtnIndex >= self.titleArr.count) {
        self.resetSelectedIndex = 0;
    }else{
        self.resetSelectedIndex = self.signBtnIndex;
    }
}

@end
