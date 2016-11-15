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
    
//    
//    CGSize textSize = [retweetedStatus.text sizeWithFont:WQStatusRetweetedTextFont constrainedToSize:maxSize];
    CGRect rect = [retweetedStatus.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil];
    self.textFrame = (CGRect){{textX,textY},rect.size};
    
//    self.textFrame = (CGRect) {{textX,textY},textSize};
    
    //自己
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = WQScreenW;
    CGFloat h = CGRectGetMaxY(self.textFrame) + WQStatusCellInset;
    
    self.retweetedFrame = CGRectMake(x, y, w, h);
    
    
    
}
@end
