//
//  NSString+Extension.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/20.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
+ (NSString *)eglishDateTransformChinaDate:(NSString *)string {
    
    NSArray * monthArray = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"];
    
    
    
    // 月
    NSRange  month ;
    month.length = 3;
    month.location = 4;
    NSString * monthStr = [string substringWithRange:month];
    NSInteger monthCount = [monthArray indexOfObject:monthStr];
    
    NSString * chinaMouth = [NSString stringWithFormat:@"%ld",monthCount + 1];
    
    
    //day
    
    NSRange day;
    day.length = 2;
    day.location = 8;
    NSString * dayStr = [string substringWithRange:day];
    
    
    
    
    // Time
    NSRange time;
    time.length = 8;
    time.location = 11;
    NSString * timeStr = [string substringWithRange:time];
    
    
    
    // Year
    
    NSRange  year;
    year.location = 26;
    year.length = 4;
    NSString * yearStr = [string substringWithRange:year];
    
    NSString * dateStr = [NSString stringWithFormat:@"%@ %@ %@ %@",yearStr,chinaMouth,dayStr,timeStr];
    
    return dateStr;
}
@end
