//
//  WQAccessToken.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQAccessToken.h"
#import "WQAccount.h"
#import "WQAccountTool.h"
@implementation WQAccessToken
- (id)init {
    if (self = [super init]) {
        self.access_token =[WQAccountTool account].access_token;
    }
    
    return self;
}

+ (instancetype)params {
    return [[self alloc] init];
}
@end
