//
//  WQStatusTool.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQHomeStatusesResult.h"
#import "WQHomeStatusesParms.h"
#import "WQSendStatusParms.h"
#import "WQSendStatusResult.h"
#import "WQBeasTool.h"

@interface WQStatusTool : WQBeasTool
/**
 *  微博数据更新请求方法
 *
 *  @param params  请求回调参数
 *  @param success 请求回调成功block参数
 *  @param failure 请求失败回调block参数
 */
+ (void)homeStatusWithParams:(WQHomeStatusesParms *)params success:(void (^)(WQHomeStatusesResult * result))success failure:(void (^)(NSError * error))failure;

/**
 *  发送没有图片微博方法
 *
 *  @param params  请求参数
 *  @param success 请求成功后block参数
 *  @param failure 请求失败后block参数
 */

+ (void)sendStatusWithParams:(WQSendStatusParms *)params success:(void (^)(WQSendStatusResult * result))success failure:(void (^)(NSError * error))failure;


@end
