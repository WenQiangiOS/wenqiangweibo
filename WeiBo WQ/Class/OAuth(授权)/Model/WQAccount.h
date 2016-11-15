//
//  WQAccount.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/2.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQAccount : NSObject <NSCoding>
/**
 *  用于调用微博的开放接口，
 */
@property (nonatomic , copy)NSString * access_token;
/**access_token的生命周期，单位是秒数。*/
@property (nonatomic , copy)NSString * expires_in;

/**账号过期时间。*/
@property (nonatomic , strong)NSDate * expires_time;
/**	授权用户的UID*/
@property (nonatomic , copy)NSString * uid;

@property (nonatomic , copy)NSString * name;
+ (instancetype)accountWithDic:(NSDictionary *)dict;
@end
