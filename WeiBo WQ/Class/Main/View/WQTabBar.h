//
//  WQTabBar.h
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/20.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WQTabBar;
@protocol WQTabBarDelegate <NSObject>;
@optional
- (void)tabBarDidClickedPlusButton:(WQTabBar *)tabBar;


@end

@interface WQTabBar : UITabBar
@property (nonatomic , weak)id<WQTabBarDelegate> tabBarDelegate;


@end
