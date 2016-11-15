//
//  WQBeasTool.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQBeasTool : NSObject
+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;

+(void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError *))failure;
@end
