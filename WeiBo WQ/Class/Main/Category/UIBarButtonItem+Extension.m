//
//  UIBarButtonItem+Extension.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/17.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+(UIBarButtonItem * )itemWithImageName:(NSString * )imageName hightImageImageName:(NSString *)hightImageName target:(id)target action:(SEL)action {
    UIButton * button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightImageName] forState:UIControlStateHighlighted];
    
    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
    
}
@end
