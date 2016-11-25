//
//  WQEmotionToolbarView.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/25.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WQEmotionToolbarView;
typedef enum {
    WQEmotionTypeRecent, // 最近
    WQEmotionTypeDefault, // 默认
    WQEmotionTypeEmoji, // Emoji
    WQEmotionTypeLxh // 浪小花
}WQEmotionType;

@protocol WQEmotionToolBarDelegate <NSObject>

@optional
- (void)emotionToolbar:(WQEmotionToolbarView *)toolbar didSelectedButton:(WQEmotionType)emotionType;

@end
@interface WQEmotionToolbarView : UIView
@property (nonatomic , strong)id <WQEmotionToolBarDelegate>delegate ;

@end
