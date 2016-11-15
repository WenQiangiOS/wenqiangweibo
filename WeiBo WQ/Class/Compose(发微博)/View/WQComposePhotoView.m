//
//  WQComposePhotoView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/10.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQComposePhotoView.h"

@implementation WQComposePhotoView
- (void)addImage:(UIImage *)image {
    
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.image = image;

    
    [self addSubview:imageView];
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    NSInteger  maxColsPerRow = 4;
    CGFloat margin = 10;
    
    CGFloat imageViewW = (self.width - (maxColsPerRow + 1) * margin)/maxColsPerRow;
    
    CGFloat imageViewH = imageViewW;
    for (NSInteger i = 0 ; i < count; i ++ ) {
        NSInteger row = i / maxColsPerRow;
        NSInteger cols = i % maxColsPerRow;
        
        
        UIImageView * imageView = self.subviews[i];
        imageView.x = margin + cols *(margin + imageViewW);
        imageView.y = row * (margin + imageViewH);
        imageView.width = imageViewW;
        imageView.height = imageViewH;
        
    }
    
    
}

- (NSArray *)images {
    NSMutableArray * array = [NSMutableArray array];
    for (UIImageView  * imageview  in self.subviews) {
        [array addObject:imageview.image];
    }
    return array;
}

@end
