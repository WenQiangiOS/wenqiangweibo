//
//  WQStatusTool.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQStatusTool.h"
#import "MJExtension.h"
#import "WQHttpTool.h"
@implementation WQStatusTool
+ (void)homeStatusWithParams:(WQHomeStatusesParms *)params success:(void (^)(WQHomeStatusesResult *))success failure:(void (^)(NSError *))failure {
    
    [WQBeasTool getWithUrl:@"https://api.weibo.com/2/statuses/home_timeline.json" param:params resultClass:[WQHomeStatusesResult class] success:success failure:failure];
    
}

+ (void)sendStatusWithParams:(WQSendStatusParms *)params success:(void (^)(WQSendStatusResult *))success failure:(void (^)(NSError *))failure {

    [WQBeasTool postWithUrl:@"https://api.weibo.com/2/statuses/update.json" param:params resultClass:[WQSendStatusResult class] success:success failure:failure];
}


@end
