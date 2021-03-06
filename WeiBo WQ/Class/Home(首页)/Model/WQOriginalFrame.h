//
//  WQOriginalFrame.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WQstatuses;
@interface WQOriginalFrame : NSObject
/** 昵称 */
@property (nonatomic, assign) CGRect nameFrame;
/** 正文 */
@property (nonatomic, assign) CGRect textFrame;

/** 头像 */
@property (nonatomic, assign) CGRect iconFrame;

/**
 *  会员图标
 */
@property (nonatomic , assign) CGRect  vipFrame;


/** 图片 */
@property (nonatomic, assign) CGRect photosFrame;


/** original 的frame */
@property (nonatomic, assign) CGRect originalFrame;

/** 微博数据 */
@property (nonatomic , strong)WQstatuses * status;

@end
