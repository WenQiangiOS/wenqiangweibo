//
//  WQAccountTool.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/2.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQAccountTool.h"
#import "WQAccount.h"

#define WQAccountFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.plist"]


@implementation WQAccountTool
+ (void)save:(WQAccount *)account {
  
    [NSKeyedArchiver archiveRootObject:account toFile:WQAccountFilePath];
    
}

+ (WQAccount *)account {
    //读取账号
    WQAccount * account = [NSKeyedUnarchiver unarchiveObjectWithFile:WQAccountFilePath];
   //读取账号时的时间
    NSDate * now  = [NSDate date];
    // 账号是否过期
    if ([now compare:account.expires_time] == NSOrderedDescending ) {
        account = nil;
    }
    return account;
}

+ (void)accesstokenWithParams:(WQAccessTokeParam *)params success:(void (^)(WQAccount *))success failure:(void (^)(NSError *))failure {
    [WQBeasTool postWithUrl:@"https://api.weibo.com/oauth2/access_token" param:params resultClass:[WQAccount class] success:success failure:failure];
}
@end
