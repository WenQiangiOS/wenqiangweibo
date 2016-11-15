//
//  WQTextView.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/5.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQTextView : UITextView
/**
 *  占位文字
 */
@property (nonatomic , copy)NSString * placehoder;
/**
 *  占位文字的颜色
 */
@property (nonatomic , strong)UIColor * placehoderColor;
@end
