//
//  WQAccountTool.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/2.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQBeasTool.h"
#import "WQAccessTokeParam.h"
@class WQAccount;

@interface WQAccountTool : WQBeasTool
/**
 *  存储账号信息
 *
 */
+ (void)save:(WQAccount *)account;
/**
 *  读取账号信息
 *
 */
+ (WQAccount *)account;


+ (void)accesstokenWithParams:(WQAccessTokeParam *)params success:(void (^)(WQAccount * account))success failure:(void (^)(NSError * error))failure;




@end
