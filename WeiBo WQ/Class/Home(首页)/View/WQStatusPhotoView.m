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
@interface WQStatusPhotoView ()
@property (nonatomic , weak)UIImageView * gifView ;

@end

@implementation WQStatusPhotoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        
        UIImageView * gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        
        [self addSubview:gifView];
        self.gifView = gifView;
        
        
        
    }
    return self;
}

- (void)setPhoto:(WQPhoto *)photo {
    _photo = photo;
    
    
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    
    NSString * extension = photo.thumbnail_pic.pathExtension.lowercaseString;
    
    self.gifView.hidden = ![extension isEqualToString:@"gif"];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gifView.x  = self.width - self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
}

@end
