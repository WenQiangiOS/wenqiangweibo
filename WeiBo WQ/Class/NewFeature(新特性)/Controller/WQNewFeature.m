//
//  WQNewFeature.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/10/25.
//  Copyright © 2016年 闻强. All rights reserved.
//

#define WQScrollerViewImageCount 4

#import "WQNewFeature.h"
#import "WQTabBarViewController.h"

@interface WQNewFeature ()<UIScrollViewDelegate>
@property (nonatomic , weak )UIPageControl * pageControl;
@end

@implementation WQNewFeature

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WQColor(246, 246, 246);
    // 设置ScrollerView
    [self setupScrollVeiw];
    // 设置pageController
    [self setupPageControl];
    
}
/**
 *  设置ScrollerView
 */
- (void)setupScrollVeiw {
    
    UIScrollView * scrollVc = [[UIScrollView alloc] init];
    scrollVc.frame = self.view.bounds;
    CGFloat imageW = scrollVc.width;
    CGFloat imageH = scrollVc.height;
    [self.view addSubview:scrollVc];
    
    
    for (int i = 0; i < WQScrollerViewImageCount; i++) {
        UIImageView * imageView = [[UIImageView alloc] init];
        NSString * name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image = [UIImage imageNamed:name];
        [scrollVc addSubview:imageView];
        
        imageView.y = 0;
        imageView.width = imageW;
        imageView.height = imageH;
        imageView.x = i * imageW;
        
        if (i == WQScrollerViewImageCount - 1) {
            [self setupButton:imageView];
        }
    
    
    
    }
    
    scrollVc.contentSize = CGSizeMake(WQScrollerViewImageCount * imageW, imageH);
    scrollVc.pagingEnabled = YES;
    scrollVc.showsHorizontalScrollIndicator = NO;
    scrollVc.bounces  =YES;
    
    scrollVc.delegate = self;
    
    
    
    
}


- (void)setupButton:(UIImageView *)imageView {
    imageView.userInteractionEnabled = YES;
    // 设置开始按钮
    [self setupStarButton:imageView];
    // 设置分享按钮
    [self setupShareButton:imageView];
    
    
}
/**
 *  设置pageController
 */
- (void)setupPageControl {
    
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = WQScrollerViewImageCount;
    pageControl.center = CGPointMake(self.view.width * 0.5, self.view.height- 30);
    [self.view addSubview:pageControl];
    
    pageControl.currentPageIndicatorTintColor = WQColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = WQColor(189, 189, 189);
    self.pageControl = pageControl;
    
}
/**
 *  scrollView 的代理
 *
 *  @param scrollView 当前的scrollView
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat page = scrollView.contentOffset.x / scrollView.width;
    int intPage = (int)(page+0.5);
    
    self.pageControl.currentPage = intPage;
}
/**
 *  设置开始按钮
 *
 */
- (void)setupStarButton:(UIImageView *)imageView {
    
    UIButton * starButton = [[UIButton alloc] init];
    
    [imageView addSubview:starButton];
    
    [starButton setImage:[UIImage imageNamed:@"new_feature_button"] forState:UIControlStateNormal];
    
    starButton.size = starButton.currentImage.size;
    
    starButton.center = CGPointMake(self.view.width * 0.5,self.view.height*0.8);
    
    [starButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
}

/**
 *  开始微博
 */
- (void)start {
    WQTabBarViewController * tabVc = [[WQTabBarViewController alloc] init];
    // 利用rootViewController 进入下一个页面
    [UIApplication sharedApplication].keyWindow.rootViewController = tabVc;
    
}

/**
 *   设置分享按钮
 *

 */
- (void)setupShareButton:(UIImageView *)imageView {
    
    UIButton * shareButton = [[UIButton alloc] init];
    [imageView addSubview:shareButton];
    shareButton.size = CGSizeMake(self.view.width*0.35, 35);
    
    shareButton.center = CGPointMake(self.view.width*0.5, self.view.height*0.7);
    
    [shareButton setTitle:@"分享大家" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [shareButton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    
    shareButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [shareButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
/**
 *  分享按钮的方法
 *

 */

- (void)share:(UIButton *)shareButton {
    //利用选中的状态来改变shareButton 的勾选状态
    shareButton.selected = !shareButton.isSelected;
}
/**
 *  验证newFeature页面是不是销毁
 */
- (void)dealloc {
    WQLOG(@"dealloc_______");
}
@end
