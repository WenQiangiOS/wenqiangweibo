//
//  WQStatusPhotosView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/23.
//  Copyright © 2016年 闻强. All rights reserved.
//




#import "WQStatusPhotosView.h"
#import "WQStatusPhotoView.h"
#import "WQPhoto.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"
#define WQStatusPhotosMaxCount 9
#define WQStatusPhotosMaxCols(photosCount) ((photosCount == 4)?2:3)
#define WQStatusPhotoW ([UIScreen mainScreen].bounds.size.width - WQStatusPhotoMargin *2 - WQStatusCellInset *2)/3
#define WQStatusPhotoMargin 5
#define WQStatusPHotoH WQStatusPhotoW


@implementation WQStatusPhotosView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor yellowColor];
        self.userInteractionEnabled = YES;
        
        for (int i = 0; i<WQStatusPhotosMaxCount; i ++) {
            WQStatusPhotoView * photoView = [[WQStatusPhotoView alloc] init];
            [self addSubview:photoView];
            photoView.tag = i;
            UITapGestureRecognizer * recoginzer = [[UITapGestureRecognizer alloc] init];
            [recoginzer addTarget:self action:@selector(tapPhoto:)];
            [photoView addGestureRecognizer:recoginzer];
            
        }
        
        
    }
    return self;
}

//轻点出现图片
- (void)tapPhoto:(UITapGestureRecognizer *)recognizer {
    
//    WQLOG(@"_______%ld",recognizer.view.tag);
//    //添加一个覆盖
//    UIView * cover = [[UIView alloc] init];
//    cover.frame = [UIScreen mainScreen].bounds;
//    cover.backgroundColor = [UIColor blackColor];
//    [[UIApplication sharedApplication].keyWindow addSubview:cover];
//    
//    WQStatusPhotoView * photoView = (WQStatusPhotoView *)recognizer.view;
//    //cover里面imageVeiw
//    UIImageView * imageView = [[UIImageView alloc] init];
//    //算出坐标
//    imageView.frame = [self convertRect:photoView.frame toView:cover];
//    imageView.image = photoView.image;
//    [cover addSubview:imageView];
//    
//    //图片放大
//    [UIView animateWithDuration:0.25 animations:^{
//        CGRect frame;
//        frame.size.width = WQScreenW;
//        frame.size.height = WQScreenW * (imageView.width/imageView.height);
//        frame.origin.x = 0;
//        frame.origin.y = (WQScreenH - frame.size.height)*0.5;
//        
//        imageView.frame = frame;
//    }];
    //创建图片浏览器
    MJPhotoBrowser * photoBrowser = [[MJPhotoBrowser alloc] init];
    //2 设置图片浏览器的所有图片
    NSMutableArray * photos = [NSMutableArray array];
    NSInteger count = self.pic_urls.count;
    
    for (int i = 0; i<count; i++) {
        WQPhoto * pic = self.pic_urls[i];
        MJPhoto * photo = [[MJPhoto alloc] init];
        
        //设置图片路径
        photo.url = [NSURL URLWithString:pic.bmiddle_pic];
        
        //设置图片来源哪个UIImageView
        photo.srcImageView = self.subviews[i];
        [photos addObject:photo];
        
    }
    photoBrowser.photos = photos;
    
    //3 设置图片默认显示图片索引
    photoBrowser.currentPhotoIndex = recognizer.view.tag;
    
    //4 显示图片浏览器
    [photoBrowser show];
    

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
