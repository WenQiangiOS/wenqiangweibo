//
//  WQHomeStatusesResult.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQHomeStatusesResult.h"
#import "MJExtension.h"
#import "WQstatuses.h"
@implementation WQHomeStatusesResult
- (NSDictionary *)objectClassInArray {
    return @{@"statuses":[WQstatuses class]};
}
@end
