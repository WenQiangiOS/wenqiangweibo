//
//  WQComposeToolBar.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/10.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    WQComposeToolButtonCamera ,//相机
    WQComposeToolButtonPicture ,//照片
    WQComposeToolButtonMention ,//提到
    WQComposeToolButtonTrend ,//话题
    WQComposeToolButtonEmotion//表情
    
}WQComposeToolButtonType;

@class WQComposeToolBar;

@protocol WQComposeToolBarDelegate <NSObject>;
@optional
- (void)composetool:(WQComposeToolBar *)toolBar didClickedButton:(WQComposeToolButtonType)tag;

@end

@interface WQComposeToolBar : UIView
@property (nonatomic , weak)id<WQComposeToolBarDelegate>delegate;


@property (nonatomic , assign,getter=isShowEmotionButton) BOOL  showEmotionButton;



@end
