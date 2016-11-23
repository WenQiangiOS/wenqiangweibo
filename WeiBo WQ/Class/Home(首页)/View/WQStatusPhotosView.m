//
//  WQStatusPhotosView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/23.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQStatusPhotosView.h"

@implementation WQStatusPhotosView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

+ (CGSize)sizeWithPhotosCount:(NSInteger)count {
    
    CGFloat photoW = 70;
    CGFloat photoH = photoW;
    
    //一行最大列数
    int maxCols = 3;
    
    //总列数
    NSInteger totalCols = count >=maxCols ? maxCols : count;
    
    //总行数
    NSInteger totalRows = (count + maxCols - 1)/maxCols;
    
    CGFloat photosW = totalCols * photoW + (totalCols -1)* WQStatusCellInset;
    
    CGFloat photosH = totalRows * photoH + (totalRows -1) *WQStatusCellInset;
    
    
    return CGSizeMake(photosW, photosH);
    
    
    
    
}
@end
