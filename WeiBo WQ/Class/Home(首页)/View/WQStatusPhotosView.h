//
//  WQStatusPhotosView.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/23.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQStatusPhotosView : UIView

@property (nonatomic , strong)NSArray * pic_urls;
/**
 *  根据图片个数,显示图片排版
 */
+ (CGSize)sizeWithPhotosCount:(NSInteger)count;
@end
