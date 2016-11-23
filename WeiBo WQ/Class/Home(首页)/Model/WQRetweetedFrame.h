//
//  WQRetweetedFrame.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WQstatuses;
@interface WQRetweetedFrame : NSObject
/** 昵称 */
@property (nonatomic, assign) CGRect nameFrame;
/** 正文 */
@property (nonatomic, assign) CGRect textFrame;
/** 图片 */
@property (nonatomic, assign) CGRect photosFrame;


/** retweeted的frame */
@property (nonatomic, assign) CGRect retweetedFrame;

/** 转发微博的数据 */

@property (nonatomic , strong)WQstatuses * retweetedStatus;
@end
