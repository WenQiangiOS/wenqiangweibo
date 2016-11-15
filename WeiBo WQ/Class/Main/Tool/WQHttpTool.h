//
//  WQHttpTool.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/10.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQHttpTool : NSObject
+ (void)get:(NSString *)url parms:(NSDictionary *)parms success:(void (^)(id))success failure:(void (^)(id))failure;

+ (void)post:(NSString *)url parms:(NSDictionary *)parms success:(void (^)(id))success failure:(void (^)(id))failure;
@end
