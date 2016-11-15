//
//  WQAccessToken.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQAccessToken : NSObject
/**	true 	string 	采用OAuth授权方式为必填参数，OAuth授权后获得。*/
@property (nonatomic , copy)NSString * access_token;

+ (instancetype)params;
@end
