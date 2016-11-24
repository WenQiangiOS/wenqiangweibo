//
//  WQTitleButton.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/19.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQTitleButton.h"

@implementation WQTitleButton
-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self ) {
        
        //图片对齐
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字对齐
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        //文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //文字字体
        self.titleLabel.font = WQNaviagtionTitleFont;
        
        
        self.adjustsImageWhenHighlighted = NO;
   
        
    }
    
    return self;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageH = self.height ;
    CGFloat imageW = self.height;
    CGFloat imageX = self.width - imageW;
    CGFloat imageY =  0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
    
    
    
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = self.width- self.height;
    CGFloat titleH  = self.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    
    NSDictionary * attribute = @{NSFontAttributeName:self.titleLabel.font};
    
    CGSize titleSize = [title sizeWithAttributes:attribute];
    
    self.width = titleSize.width + 10 + self.height;
    
}

@end
