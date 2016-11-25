//
//  WQEmotionToolbarView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/25.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQEmotionToolbarView.h"
#define WQEmotionToolBarMaxButtonCount 4
@interface WQEmotionToolbarView ()
@property (nonatomic , weak)UIButton * selectedButton;

@end
@implementation WQEmotionToolbarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buttonWithName:@"最近" tag:WQEmotionTypeRecent];
        UIButton * defaultButton = [self buttonWithName:@"默认" tag:WQEmotionTypeDefault];
        [self buttonWithName:@"Emoji" tag:WQEmotionTypeEmoji];
        [self buttonWithName:@"浪小花" tag:WQEmotionTypeLxh];
        
        //设置默认按钮
        [self buttonClick:defaultButton];
    }
    return self;
}

/**
 *  设置工具条button 按钮
 */

- (UIButton *)buttonWithName:(NSString *)name tag:(WQEmotionType)tag {
    UIButton * button = [[UIButton alloc] init];
    button.tag = tag;
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    button.titleLabel.font = WQStatusOrginalNameFont;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置背景图片
    int count = WQEmotionToolBarMaxButtonCount;
    if (count == 1) { // 第一个按钮
        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_left_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_left_selected"] forState:UIControlStateSelected];
    } else if (count == WQEmotionToolBarMaxButtonCount) { // 最后一个按钮
        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_right_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_right_selected"] forState:UIControlStateSelected];
    } else { // 中间按钮
        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_mid_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage resizedImage:@"compose_emotion_table_mid_selected"] forState:UIControlStateSelected];
    }
    
    [self addSubview:button];
    
    
    return button;
    
}


- (void)buttonClick:(UIButton *)button {
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    
    if ([self.delegate respondsToSelector:@selector(emotionToolbar:didSelectedButton:)]) {
        [self.delegate emotionToolbar:self didSelectedButton:button.tag];
    }
}

- (void)layoutSubviews {
    //设置button的frame
    
    
    CGFloat buttonW = self.width /WQEmotionToolBarMaxButtonCount;
    CGFloat buttonH = self.height;
    
    for (int i = 0; i<WQEmotionToolBarMaxButtonCount; i++) {
        UIButton * button = self.subviews[i];
        button.width = buttonW;
        button.height= buttonH;
        button.x = i * buttonW;
    }
    
}

@end
