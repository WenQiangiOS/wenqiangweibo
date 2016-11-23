//
//  WQStatusPhotoView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/23.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQStatusPhotoView.h"
#import "WQPhoto.h"
#import "UIImageView+WebCache.h"
@implementation WQStatusPhotoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setPhoto:(WQPhoto *)photo {
    _photo = photo;
    
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
}

@end
