//
//  WQHttpTool.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/10.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQHttpTool.h"
#import "AFNetworking.h"

@implementation WQHttpTool
+ (void)get:(NSString *)url parms:(NSDictionary *)parms success:(void (^)(id))success failure:(void (^)(id))failure{
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    
    
    //get请求
    [mgr GET:url parameters:parms success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
    
}


+ (void)post:(NSString *)url parms:(NSDictionary *)parms success:(void (^)(id))success failure:(void (^)(id))failure{
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    
    //post请求
    [mgr POST:url parameters:parms success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
    
}
@end
