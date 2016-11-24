//
//  WQPhoto.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/3.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQPhoto : NSObject
/**	string 	缩略图片地址，没有时不返回此字段*/
@property (nonatomic , copy)NSString * thumbnail_pic;

/**
 *  大图
 */

@property (nonatomic , copy)NSString * bmiddle_pic;
@end
