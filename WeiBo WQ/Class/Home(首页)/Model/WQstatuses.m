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

//get 方法时刻都是在调用
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
                return  [fmt stringFromDate:newDate];
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


//set方法只是模型赋值的时候调用一次,以后都不会再调运
- (void)setSource:(NSString *)source {
    NSRange  range ;
    
    range = [source rangeOfString:@">"];
    if (range.length ==  NSNotFound || range.length == 0) {
        _source = @"不明AOE";
    } else  {
        NSRange range2;
        range2.location = [source rangeOfString:@">"].location +1;
        
        range2.length = [source rangeOfString:@"</"].location - range2.location;
        
        if (range2.length == NSNotFound || range2.length == 0) {
            _source = @"不明AOE";
        } else {
            _source = [source substringWithRange:range2];
//            
        }
        
        
    }
    
}




@end
