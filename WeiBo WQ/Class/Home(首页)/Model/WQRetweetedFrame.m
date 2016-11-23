//
//  WQRetweetedFrame.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQRetweetedFrame.h"
#import "WQstatuses.h"
#import "WQUser.h"
#import "WQStatusPhotosView.h"
@implementation WQRetweetedFrame
- (void)setRetweetedStatus:(WQstatuses *)retweetedStatus {
    _retweetedStatus = retweetedStatus;
    
    
    //昵称
    CGFloat nameX = WQStatusCellInset;
    CGFloat nameY = WQStatusCellInset;
    NSDictionary * nameAttr = @{NSFontAttributeName:WQStatusRetweetedNameFont};
    
    CGSize nameSize = [retweetedStatus.user.name sizeWithAttributes:nameAttr];
    self.nameFrame = (CGRect){{nameX,nameY},nameSize};
    
    
    // 正文
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(self.nameFrame) + WQStatusCellInset;
    CGFloat textW = WQScreenW - 2 *WQStatusCellInset;
    CGSize maxSize = CGSizeMake(textW, MAXFLOAT);
    NSDictionary * textAttr = @{NSFontAttributeName:WQStatusRetweetedTextFont};
    
    CGRect rect = [retweetedStatus.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil];
    self.textFrame = (CGRect){{textX,textY},rect.size};
    
    
    //图片
    
    CGFloat h= 0;
    if (retweetedStatus.pic_urls.count) {
        CGFloat photosX = textX;
        CGFloat photosY = CGRectGetMaxY(self.textFrame) + WQStatusCellInset;
        CGSize  photosSize = [WQStatusPhotosView sizeWithPhotosCount:retweetedStatus.pic_urls.count];
        self.photosFrame = (CGRect){{photosX,photosY},photosSize};
        h = CGRectGetMaxY(self.photosFrame) + WQStatusCellInset;
        
        
    } else {
        h = CGRectGetMaxY(self.textFrame) + WQStatusCellInset;
    }
    
    
    
    //自己
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = WQScreenW;
    
    self.retweetedFrame = CGRectMake(x, y, w, h);
    
    
    
}
@end
