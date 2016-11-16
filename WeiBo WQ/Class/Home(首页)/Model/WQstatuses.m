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
    NSDateFormatter * fmt = [[NSDateFormatter alloc] init];
    //Wed Nov 16 20:39:49 +0800 2016
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    
    NSDate * createDate = [fmt dateFromString:_created_at];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
  
    NSString * timeStr = [fmt stringFromDate:createDate];
    
  
    
    

    
    
    
    WQLOG(@"%@",timeStr);

    


    
    
return timeStr;
    

    
}
@end
