//
//  WQTabBar.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/20.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQTabBar.h"
@interface WQTabBar ()
@property (nonatomic , strong) UIButton * plusButton;
@end


@implementation WQTabBar



- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 设置tabbar的外观
//        [self setupTabBarAppreance];
        //设置加号按钮
        [self setupPlusButton];
        
        
       
        
    }
    
    return self;
}


//// 设置tabbar的外观
//
//- (void)setupTabBarAppreance {
//    
//}


//设置加号按钮

- (void)setupPlusButton {
    UIButton *  plusButton = [[UIButton alloc] init];
    
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    [plusButton addTarget:self action:@selector(pluseClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:plusButton];
    
    self.plusButton = plusButton;
}


/**
 *  布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置tabBar的frame
    [self setupTabbarButtonFrame];
    //设置plusbutton的frame
    [self setupPlusButtonFrame];

}

//设置plusbutton的frame
- (void)setupPlusButtonFrame {
    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
    self.plusButton.center = CGPointMake(self.width*0.5, self.height*0.5);
}

// 设置tabBar的frame

- (void)setupTabbarButtonFrame{
    int index = 0;
    // 计算button的尺寸
    CGFloat buttonW = self.width/(self.items.count +1);
    CGFloat buttonH = self.height;
    
    for (UIView * tabbarButton in self.subviews) {
        if (![tabbarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])continue;
        //根据索引调整item的位置
        tabbarButton.width = buttonW;
        tabbarButton.height= buttonH;
        tabbarButton.x = tabbarButton.width*index;
        if (index >= 2) {
            tabbarButton.x= tabbarButton.width * (index + 1);
        } else {
            tabbarButton.x= tabbarButton.width * index;
        }
        
        tabbarButton.y = 0;
        
        //索引增加
        
        index ++;
    }
    
}
    
- (void)pluseClick {
    
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]) {
        [self.tabBarDelegate tabBarDidClickedPlusButton:self];
    }
}

@end
