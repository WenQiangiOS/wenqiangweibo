//
//  WQStatusPhotosView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/23.
//  Copyright © 2016年 闻强. All rights reserved.
//




#import "WQStatusPhotosView.h"
#import "WQStatusPhotoView.h"
#define WQStatusPhotosMaxCount 9
#define WQStatusPhotosMaxCols(photosCount) ((photosCount == 4)?2:3)
#define WQStatusPhotoW ([UIScreen mainScreen].bounds.size.width - WQStatusPhotoMargin *2 - WQStatusCellInset *2)/3
#define WQStatusPhotoMargin 5
#define WQStatusPHotoH WQStatusPhotoW


@implementation WQStatusPhotosView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor yellowColor];
        
        for (int i = 0; i<WQStatusPhotosMaxCount; i ++) {
            WQStatusPhotoView * photoView = [[WQStatusPhotoView alloc] init];
            [self addSubview:photoView];
        }
        
        
    }
    return self;
}

//图片循环显示
- (void)setPic_urls:(NSArray *)pic_urls {
    _pic_urls = pic_urls;
    
    for (int i = 0; i<WQStatusPhotosMaxCount; i++) {
        
        WQStatusPhotoView * photoView = self.subviews[i];
        
        if (i<pic_urls.count) {
            photoView.photo = pic_urls[i];
            photoView.hidden = NO;
        }else {
            photoView.hidden = YES;
        }
    }
}


//布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.pic_urls.count;
    NSInteger maxCols = WQStatusPhotosMaxCols(count);
    for (int i = 0; i<count; i++) {
        WQStatusPhotoView * photoView = self.subviews[i];
        photoView.width = WQStatusPhotoW;
        photoView.height = WQStatusPHotoH;
        photoView.x = (i%maxCols)*(WQStatusPhotoW + WQStatusPhotoMargin);
        photoView.y = (i/maxCols) *(WQStatusPHotoH+ WQStatusPhotoMargin);
        
    }
    
    
}


+ (CGSize)sizeWithPhotosCount:(NSInteger)count {
    

    
    //一行最大列数
    NSInteger maxCols = WQStatusPhotosMaxCols(count);
    
    //总列数
    NSInteger totalCols = count >=maxCols ? maxCols : count;
    
    //总行数
    NSInteger totalRows = (count + maxCols - 1)/maxCols;
    
    CGFloat photosW = totalCols * WQStatusPhotoW + (totalCols -1)* WQStatusPhotoMargin;
    
    CGFloat photosH = totalRows * WQStatusPHotoH + (totalRows -1) *WQStatusPhotoMargin;
    
    
    return CGSizeMake(photosW, photosH);
    
    
    
    
}
@end
