//
//  WQLoadingMoreFooter.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/4.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQLoadingMoreFooter : UIView
+ (instancetype)loadingMoreView;
- (void)begingRefreshing;
- (void)endRefreshing;



@property (nonatomic , assign, getter=isRefreshing) BOOL  refreshing;


@end
