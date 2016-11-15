//
//  WQLoadingMoreFooter.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/4.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQLoadingMoreFooter.h"
@interface WQLoadingMoreFooter ()
@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingActive;

@end
@implementation WQLoadingMoreFooter
+ (instancetype)loadingMoreView {
    return [[[NSBundle mainBundle] loadNibNamed:@"WQLoadingMoreFooter" owner:nil options:nil] lastObject];
}


- (void)begingRefreshing {
    self.loadingLabel.text= @"正在拼命加载中";
    [self.loadingActive startAnimating];
    self.refreshing = YES;
    
}

- (void)endRefreshing {
    self.loadingLabel.text = @"上拉可以加载更多数据";
    [self.loadingActive stopAnimating];
    self.refreshing = NO;
}

@end
