//
//  WQUnReadCountParam.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQAccessToken.h"

@interface WQUnReadCountParam : WQAccessToken
/** false	int64	需要查询的用户ID。*/
@property (nonatomic, copy) NSString *uid;
@end
