//
//  WQComposeToolBar.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/10.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQComposeToolBar.h"
@interface WQComposeToolBar ()
@property (nonatomic , strong)UIButton * emotionButton;
@end
@implementation WQComposeToolBar


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加所用按钮
        
        
        [self addImageIcon:@"compose_camerabutton_background_os7" hightIcon:@"compose_camerabutton_background_highlighted_os7" tag:WQComposeToolButtonCamera];
        [self addImageIcon:@"compose_toolbar_picture_os7" hightIcon:@"compose_toolbar_picture_highlighted_os7" tag:WQComposeToolButtonPicture];
        [self addImageIcon:@"compose_trendbutton_background_os7" hightIcon:@"compose_trendbutton_background_highlighted_os7" tag:WQComposeToolButtonTrend];
        [self addImageIcon:@"compose_mentionbutton_background_os7" hightIcon:@"compose_mentionbutton_background_highlighted_os7" tag:WQComposeToolButtonMention];
      self.emotionButton = [self addImageIcon:@"compose_emoticonbutton_background_os7" hightIcon:@"compose_emoticonbutton_background_highlighted_os7" tag:WQComposeToolButtonEmotion];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"compose_toolbar_background"]];

    }
    return self;
}


- (UIButton *)addImageIcon:(NSString *)iconName hightIcon:(NSString *)hightIcon tag:(WQComposeToolButtonType)tag {
    UIButton * button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightIcon] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    [self addSubview:button];
    
    return button;
}

- (void)setShowEmotionButton:(BOOL)showEmotionButton {
    _showEmotionButton = showEmotionButton;
    if (showEmotionButton) {
        [self.emotionButton setImage:[UIImage imageNamed:@"compose_emoticonbutton_background_os7"] forState:UIControlStateNormal];
        [self.emotionButton setImage:[UIImage imageNamed:@"compose_emoticonbutton_background_highlighted_os7"] forState:UIControlStateHighlighted];
        showEmotionButton = NO;
    }else {
        [self.emotionButton setImage:[UIImage imageNamed:@"compose_keyboardbutton_background"] forState:UIControlStateNormal];
        [self.emotionButton setImage:[UIImage imageNamed:@"compose_keyboardbutton_background_highlighted"] forState:UIControlStateHighlighted];
        showEmotionButton = YES;
    }
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
