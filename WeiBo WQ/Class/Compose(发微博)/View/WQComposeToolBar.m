//
//  WQComposeToolBar.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/10.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQComposeToolBar.h"

@implementation WQComposeToolBar
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加所用按钮
        
        
        [self addImageIcon:@"compose_camerabutton_background" hightIcon:@"compose_camerabutton_background_highlighted" tag:WQComposeToolButtonCamera];
        [self addImageIcon:@"compose_toolbar_picture" hightIcon:@"compose_toolbar_picture_highlighted" tag:WQComposeToolButtonPicture];
        [self addImageIcon:@"compose_trendbutton_background" hightIcon:@"compose_trendbutton_background_highlighted" tag:WQComposeToolButtonTrend];
        [self addImageIcon:@"compose_mentionbutton_background" hightIcon:@"compose_mentionbutton_background_highlighted" tag:WQComposeToolButtonMention];
        [self addImageIcon:@"compose_emoticonbutton_background" hightIcon:@"compose_emoticonbutton_background_highlighted" tag:WQComposeToolButtonEmotion];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"compose_toolbar_background"]];

    }
    return self;
}


- (void)addImageIcon:(NSString *)iconName hightIcon:(NSString *)hightIcon tag:(WQComposeToolButtonType)tag {
    UIButton * button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightIcon] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    [self addSubview:button];
}

- (void)buttonClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(composetool:didClickedButton:)]) {
        [self.delegate composetool:self didClickedButton:button.tag];
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat buttonW  = self.width/count;
    CGFloat buttonH = self.height;
    for (NSInteger i; i< count; i++) {

        self.subviews[i].frame = CGRectMake(i * buttonW, 0, buttonW, buttonH);
    }
    
}

@end
