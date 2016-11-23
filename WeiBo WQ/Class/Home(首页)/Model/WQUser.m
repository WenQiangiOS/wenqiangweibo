//
//  WQUser.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/3.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQUser.h"

@implementation WQUser
- (BOOL)isVip {
    return self.mbtype >2;
}
@end
