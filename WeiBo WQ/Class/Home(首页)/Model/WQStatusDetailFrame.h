//
//  WQStatusDetailFrame.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WQOriginalFrame,WQRetweetedFrame,WQstatuses;
@interface WQStatusDetailFrame : NSObject
/***  设置微博原文frame*/
@property (nonatomic , strong)WQOriginalFrame * originalFrame;

/***  设置微博转发frame*/
@property (nonatomic , strong)WQRetweetedFrame * retweetedFrame;

/***  设置微博正文frame*/
@property (nonatomic , assign) CGRect  frame;

/***  设置微博数据*/
@property (nonatomic , strong)WQstatuses * status;


@end
