//
//  WQBeasTool.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQBeasTool.h"
#import "WQHttpTool.h"
#import "MJExtension.h"

@implementation WQBeasTool
+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    NSDictionary * params = [param keyValues];
    [WQHttpTool post:url parms:params success:^(id responseObject) {
        id result = [resultClass objectWithKeyValues:responseObject];
        success (result);
    } failure:^(NSError * error) {
        if (failure) {
            failure (error);
        }
        
    }];
}

+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    NSDictionary * params = [param keyValues];
    [WQHttpTool get:url parms:params success:^(id responseObject) {
        id result = [resultClass objectWithKeyValues:responseObject];
        success (result);
    } failure:^(NSError * error) {
        if (failure) {
             failure (error);
        }
       
    }];
}
@end
