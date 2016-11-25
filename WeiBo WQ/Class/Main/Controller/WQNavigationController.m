//
//  WQNavigationController.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/17.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQNavigationController.h"
@interface WQNavigationController ()

@end
@implementation WQNavigationController

// 第一次调用和这个类的时候调用
+ (void)initialize {
    [self setBarButtonItem];
    [self setNavigationItem];
}
+(void)setNavigationItem {
    
    UINavigationBar * appearance = [UINavigationBar appearance];
    NSDictionary * attrs = @{NSFontAttributeName:WQNaviagtionTitleFont,NSForegroundColorAttributeName:[UIColor blackColor]};
    [appearance setTitleTextAttributes:attrs];
    
}

+ (void)setBarButtonItem{
    
    // 设置UIBarButtonItem 的主题颜色
    //普通状态
    UIBarButtonItem * appearance = [UIBarButtonItem appearance];
    NSDictionary * attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor darkGrayColor]};
    [appearance setTitleTextAttributes:attrs forState:UIControlStateNormal];
    //高亮状态
    
    UIBarButtonItem * appearance2 = [UIBarButtonItem appearance];
    NSDictionary * attrs2 = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor orangeColor]};
    [appearance2 setTitleTextAttributes:attrs2 forState:UIControlStateHighlighted];
    //不可选状态
    UIBarButtonItem * appearance3 = [UIBarButtonItem appearance];
    NSDictionary * attrs3 = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor redColor]};
    [appearance3 setTitleTextAttributes:attrs3 forState:UIControlStateDisabled];

    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //非栈底控制器时
    if (self.viewControllers.count > 0) {
            viewController.hidesBottomBarWhenPushed = YES;
        //1左边
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" hightImageImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        
        //2 右边
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" hightImageImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];

    }
    

    [super pushViewController:viewController animated:animated];
}


- (void)back {
    
    [self popViewControllerAnimated:YES];
    
}

- (void)more {
    [self  popToRootViewControllerAnimated:YES];
    
    
}
@end
