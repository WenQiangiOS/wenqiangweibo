//
//  NSString+Extension.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/20.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  英文格式时间转换为中文格式时间
 *
 *  @param string 英文时间字符串
 *
 *  @return 中文时间字符串
 */
+ (NSString *)eglishDateTransformChinaDate:(NSString *)string;
@end
