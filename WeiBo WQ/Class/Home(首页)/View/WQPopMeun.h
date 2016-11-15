//
//  WQPopMeun.h
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/19.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  尖头的方向
 */
typedef enum{
    WQPopMeunArrowCenter,
    WQPopMeunArrowRight,
    WQPopMeunArrowLeft
    
    
}WQPopMeunArrowPosintion;



@class WQPopMeun;
@protocol WQPopMenuDelegate <NSObject>

@optional
- (void)popMenuDismissed:(WQPopMeun *)popMenu;
@end

@interface WQPopMeun : UIView
@property (nonatomic , weak) id<WQPopMenuDelegate>delegate;
/**
 *  设置是否有灰色的背景色
 */
@property (nonatomic , assign, getter=isDimBackgroud) BOOL  dimBackgroud;


@property (nonatomic , assign)   WQPopMeunArrowPosintion arrowPostion;



//初始化空间
- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)popMenuWithContentView:(UIView *)contView;
/**
 *  设置背景图片
 */
- (void)setBackgroundImage:(UIImage *)background;
/**
 *  显示菜单
 *
 */
- (void)showInRect:(CGRect)rect;
/**
 *  关闭菜单
 */
- (void)dismissMenu;


@end
