//
//  UIImage+Extension.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/16.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)name {
    UIImage * image = nil;
    
    if (iOS7) {
        NSString * newName = [name stringByAppendingString:@"_os7"];
        
        image = [UIImage imageNamed:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    
    return image;

    
}

//拉伸图片

+ (UIImage *)resizedImage:(NSString *)name {
    UIImage * image = [UIImage imageNamed:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
