//
//  TESTViewController.m
//  SGPagingViewExample
//
//  Created by liyufeng on 2019/5/16.
//  Copyright © 2019 Sorgle. All rights reserved.
//

#import "TESTViewController.h"
#import "SGPagingView.h"
#import "ChildVCOne.h"
#import "ChildVCTwo.h"
#import "ChildVCThree.h"
#import "ChildVCFour.h"
#import "ChildVCFive.h"
#import "ChildVCSix.h"
#import "ChildVCSeven.h"
#import "ChildVCEight.h"
#import "ChildVCNine.h"
#import "SGPageContentScrollView+multable.h"
#import "SGPageTitleView+multable.h"

@interface TESTViewController () <SGPageTitleViewDelegate, SGPageContentScrollViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;

@end

@implementation TESTViewController

- (void)dealloc {
    NSLog(@"DefaultAnimatedVC - - dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupPageView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(add:)];
}

- (void)add:(UIBarButtonItem *)item{
    ChildVCOne *oneVC = [[ChildVCOne alloc] init];
    ChildVCTwo *twoVC = [[ChildVCTwo alloc] init];
    ChildVCThree *threeVC = [[ChildVCThree alloc] init];
    ChildVCFour *fourVC = [[ChildVCFour alloc] init];
    ChildVCFive *fiveVC = [[ChildVCFive alloc] init];
    ChildVCSix *sixVC = [[ChildVCSix alloc] init];
    ChildVCSeven *sevenVC = [[ChildVCSeven alloc] init];
    NSArray *childArr = @[oneVC, twoVC, threeVC, fourVC, fiveVC, sixVC, sevenVC];
    [self.pageContentScrollView resetChildVCs:childArr];
    NSArray *titleArr = @[@"精选1", @"电影1", @"电视剧1", @"综艺1"];
    [self.pageTitleView resetTitleNames:titleArr];
    
}

- (void)setupPageView {
    CGFloat statusHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    CGFloat pageTitleViewY = 0;
    if (statusHeight == 20.0) {
        pageTitleViewY = 64;
    } else {
        pageTitleViewY = 88;
    }
    
    NSArray *titleArr = @[@"精选", @"电影", @"电视剧"
                          , @"综艺", @"NBA", @"娱乐", @"动漫", @"演唱会", @"VIP会员"
                          ];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    NSLayoutConstraint * left = [NSLayoutConstraint constraintWithItem:self.pageTitleView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint * top = [NSLayoutConstraint constraintWithItem:self.pageTitleView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint * width = [NSLayoutConstraint constraintWithItem:self.pageTitleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    NSLayoutConstraint * height = [NSLayoutConstraint constraintWithItem:self.pageTitleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44];
    [self.view addConstraints:@[left,top,width,height]];
    
    ChildVCOne *oneVC = [[ChildVCOne alloc] init];
    ChildVCTwo *twoVC = [[ChildVCTwo alloc] init];
    ChildVCThree *threeVC = [[ChildVCThree alloc] init];
    ChildVCFour *fourVC = [[ChildVCFour alloc] init];
    ChildVCFive *fiveVC = [[ChildVCFive alloc] init];
    ChildVCSix *sixVC = [[ChildVCSix alloc] init];
    ChildVCSeven *sevenVC = [[ChildVCSeven alloc] init];
    ChildVCEight *eightVC = [[ChildVCEight alloc] init];
    NSArray *childArr = @[oneVC, twoVC, threeVC
                          , fourVC, fiveVC, sixVC, sevenVC, eightVC
                          ];
    /// pageContentScrollView
    CGFloat ContentCollectionViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), self.view.frame.size.width, ContentCollectionViewHeight) parentVC:self childVCs:childArr];
    _pageContentScrollView.delegatePageContentScrollView = self;
    [self.view addSubview:_pageContentScrollView];
    _pageContentScrollView.isAnimated = YES;
     left = [NSLayoutConstraint constraintWithItem:self.pageContentScrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
     top = [NSLayoutConstraint constraintWithItem:self.pageContentScrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.pageTitleView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
     width = [NSLayoutConstraint constraintWithItem:self.pageContentScrollView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
     NSLayoutConstraint * bottom = [NSLayoutConstraint constraintWithItem:self.pageContentScrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.view addConstraints:@[left,top,width,bottom]];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

/// 说明：1、这里的处理是为了滚动过程中（手指未离开屏幕）点击标题再滚动造成标题与内容短暂的不一致
/// 说明：2、了解了一下市场上的 app，大致分为二种情况：一种是滚动过程中标题可以点击（网易新闻、今日头条）；另一种是滚动过程中标题不可以点击（贝贝、汽车之家）
/// 说明：3、淘宝->微淘界面（带动画）也会存在这种情况但相对来说比我处理得好；所以我只能让动画与说明：2、的后一种情况相结合来做处理（美其名也：为了用户体验）
- (void)pageContentScrollViewWillBeginDragging {
    _pageTitleView.userInteractionEnabled = NO;
}

- (void)pageContentScrollViewDidEndDecelerating {
    _pageTitleView.userInteractionEnabled = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
