//
//  WQstatuses.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/3.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQstatuses.h"
#import "MJExtension.h"
#import "WQPhoto.h"
@implementation WQstatuses
- (NSDictionary *)objectClassInArray {
    return @{@"pic_ids" : [WQPhoto class]};
}

- (NSString *)created_at {

  NSString * dateStr = [NSString eglishDateTransformChinaDate:_created_at];
    
    
    NSDateFormatter * fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy MM dd HH:mm:ss";
    
    NSDate * newDate = [fmt dateFromString:dateStr];
    
    
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSString * newDateStr = [fmt stringFromDate:newDate];
    
  
    
    
    WQLOG(@"%@",newDateStr);
   
    return dateStr;
    
}


@end
