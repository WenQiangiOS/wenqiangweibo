//
//  WQUserTool.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQUserInfoParms.h"
#import "WQUserInfoResult.h"
#import "WQBeasTool.h"
#import "WQUnReadCountParam.h"
#import "WQUnreadCountResult.h"
@interface WQUserTool : WQBeasTool

/**
 *  用户数据更新请求方法
 *
 *  @param params  请求回调参数
 *  @param success 请求回调成功block参数
 *  @param failure 请求失败回调block参数
 */
+ (void)userInfoWithParams:(WQUserInfoParms *)params success:(void (^)(WQUserInfoResult * result))success failure:(void (^)(NSError * error))failure;



/**
 *  未读信息
 *
 *  @param params  请求参数
 *  @param success 请求成功
 *  @param failure 请求失败
 */

+ (void)unreadCountWithParams:(WQUnReadCountParam *)params success:(void (^)(WQUnreadCountResult * result))success failure:(void (^)(NSError * error))failure;
@end
