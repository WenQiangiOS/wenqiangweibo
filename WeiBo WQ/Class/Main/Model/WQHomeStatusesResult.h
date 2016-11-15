//
//  WQHomeStatusesResult.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
// 微博请求结果模型

#import <Foundation/Foundation.h>

@interface WQHomeStatusesResult : NSObject

/** 微博数组（装着HMStatus模型） */
@property (nonatomic, strong) NSArray *statuses;

/** 近期的微博总数 */
@property (nonatomic, assign) int total_number;
@end
