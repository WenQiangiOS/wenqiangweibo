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
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate * newDate = [fmt dateFromString:dateStr];
    
    //比较微博发送时间和现在时间的区别方法
    NSDateComponents * cmps = [newDate deltaWithNow];
    
    
    if (newDate.isThisYear) {
        
        if (newDate.isToday) {
            if (cmps.hour >=1) {//大于一小时
                fmt.dateFormat = @"HH:mm";
                return [fmt stringFromDate:newDate];
            } else if (cmps.minute>=1){//大于一分钟
                return [NSString stringWithFormat:@"%ld分钟前",cmps.minute];
            } else {//小于60秒
                   return @"刚刚";
            }
            
        }else if (newDate.isYesterday) { // 昨天发的微博
            
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:newDate];
        }else { // 前天发的微博
            
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:newDate];
        }
    }else { // 非今年
        fmt.dateFormat = @"yy-MM-dd HH:mm:ss";
        return [fmt stringFromDate:newDate];

    }
    
    
    
  
    
    
  
   
    
}


@end
