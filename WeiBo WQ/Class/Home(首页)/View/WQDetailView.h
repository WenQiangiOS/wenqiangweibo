//
//  WQDetailView.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
// 是有originalView 和retweetedView 组成的

#import <UIKit/UIKit.h>
@class WQStatusDetailFrame;
@interface WQDetailView : UIImageView
@property (nonatomic , strong)WQStatusDetailFrame* detailFrame;
@end
