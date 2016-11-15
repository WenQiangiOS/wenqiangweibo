//
//  WQUserTool.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQUserTool.h"
#import "MJExtension.h"
#import "WQHttpTool.h"
@implementation WQUserTool
+ (void)userInfoWithParams:(WQUserInfoParms *)params success:(void (^)(WQUserInfoResult *))success failure:(void (^)(NSError *))failure {

    [WQBeasTool getWithUrl:@"https://api.weibo.com/2/users/show.json"  param:params resultClass:[WQUserInfoResult class] success:success failure:failure];
}



+ (void)unreadCountWithParams:(WQUnReadCountParam *)params success:(void (^)(WQUnreadCountResult *))success failure:(void (^)(NSError *))failure {
    [WQBeasTool getWithUrl:@"https://rm.api.weibo.com/2/remind/unread_count.json" param:params resultClass:[WQUnreadCountResult class] success:success failure:failure];
}

@end
