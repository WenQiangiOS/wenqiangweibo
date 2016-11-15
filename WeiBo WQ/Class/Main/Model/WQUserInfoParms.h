//
//  WQUserInfoParms.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQAccessToken.h"

@interface WQUserInfoParms : WQAccessToken
/**	false 	int64 	需要查询的用户ID。*/
@property (nonatomic , strong) NSNumber *   uid;
@end
