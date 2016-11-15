//
//  WQControlTool.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/2.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQControlTool.h"
#import "WQTabBarViewController.h"
#import "WQNewFeature.h"

@implementation WQControlTool
+ (void)chooseRootViewController{
    NSString * versionKey = (__bridge NSString *)kCFBundleVersionKey;
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * lastVersion = [defaults objectForKey:versionKey];
    NSString * currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    UIWindow * windonw = [UIApplication sharedApplication].keyWindow;
    
    
    if ([currentVersion isEqualToString:lastVersion]) {
        windonw.rootViewController = [[WQTabBarViewController alloc]init];
    } else {
        windonw.rootViewController = [[WQNewFeature alloc] init];
        
        [defaults setObject:currentVersion forKey:versionKey];
        [defaults synchronize];
        
    }
    

}

@end
