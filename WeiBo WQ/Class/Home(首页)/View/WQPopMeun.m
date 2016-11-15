//
//  WQPopMeun.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/19.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQPopMeun.h"
@interface WQPopMeun ()
@property (nonatomic , strong) UIView * contentView;

/**
 *  最底部遮盖,屏蔽菜单以外的空间操作
 */
@property (nonatomic , weak) UIButton * cover;

/**
 *  容器,容纳具体要显示的内容
 */
@property (nonatomic , weak) UIImageView * container;






@end


@implementation WQPopMeun
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton * cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        UIImageView * container = [[UIImageView alloc] init];
        
//        container.image = [UIImage resizedImage:@"popover_background"];
        
        container.userInteractionEnabled = YES;
        
        [self addSubview:container];
        
        self.container = container;
        
        self.arrowPostion = WQPopMeunArrowCenter;
    }
    
    return self;
}

- (instancetype)initWithContentView:(UIView *)contentView {
    if (self = [super init]) {
        self.contentView = contentView;
    }
    
    return self;
}

+ (instancetype)popMenuWithContentView:(UIView *)contView {
    return [[self alloc] initWithContentView:contView];
}


#pragma mark 私有方法
- (void)onClick {
    
    [self dismissMenu];
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.cover.frame = self.bounds;
}


#pragma mark 公共方法


- (void)setDimBackgroud:(BOOL)dimBackgroud {
    _dimBackgroud = dimBackgroud;
    
    if (dimBackgroud) {
        self.cover.backgroundColor = [UIColor grayColor];
        self.cover.alpha = 0.3;
    } else {
        self.cover.backgroundColor = [UIColor clearColor];
    }
}


- (void)setArrowPostion:(WQPopMeunArrowPosintion)arrowPostion {
    _arrowPostion = arrowPostion;
    switch (arrowPostion) {
        case WQPopMeunArrowCenter:
            self.container.image = [UIImage resizedImage:@"popover_background"];
            break;
        case WQPopMeunArrowLeft:
            self.container.image = [UIImage resizedImage:@"popover_background_left"];
        case WQPopMeunArrowRight:
            self.container.image = [UIImage resizedImage:@"popover_background_right"];

    }
}

- (void)setBackgroundImage:(UIImage *)background {
    
    self.container.image = background;
    
}

- (void)showInRect:(CGRect)rect {
    
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    
    [window addSubview:self];
    
    self.container.frame = rect;
    
    [self.container addSubview:self.contentView];
    
    
    
    // 设置容器里面内容的frame
    CGFloat topMargin = 12;
    CGFloat leftMargin = 5;
    CGFloat rightMargin = 5;
    CGFloat bottomMargin = 8;
    
    self.contentView.y = topMargin;
    self.contentView.x = leftMargin;
    self.contentView.width = self.container.width - leftMargin - rightMargin;
    self.contentView.height = self.container.height - topMargin - bottomMargin;
    
}


- (void)dismissMenu {
    if ([self.delegate  respondsToSelector:@selector(popMenuDismissed:)]) {
        [self.delegate popMenuDismissed:self];
    }
    
    [self removeFromSuperview];
}

@end
