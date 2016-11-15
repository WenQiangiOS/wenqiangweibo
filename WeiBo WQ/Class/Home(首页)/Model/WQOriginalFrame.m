//
//  WQOriginalFrame.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQOriginalFrame.h"
#import "WQstatuses.h"
#import "WQUser.h"
@implementation WQOriginalFrame
- (void)setStatus:(WQstatuses *)status {
    _status = status;
    /** 头像 */
    CGFloat iconX = 10;
    CGFloat iconY = 10;
    CGFloat iconW = 45;
    CGFloat iconH = 45;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);

    
    
    /** 昵称 */
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + WQStatusCellInset;
    CGFloat nameY = iconY;

    
    NSDictionary * attributes = @{NSFontAttributeName:WQStatusOrginalNameFont};
    CGSize nameSize = [status.user.name sizeWithAttributes:attributes];

    self.nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    

    
    /** 时间 */
    
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameFrame) + WQStatusCellInset;
    
    
    NSDictionary * timeAttributes = @{NSFontAttributeName:WQStatusOrginalTimeFont};

    CGSize timeSize = [status.user.created_at sizeWithAttributes:timeAttributes];
    self.timeFrame = (CGRect){{timeX,timeY},timeSize};
    

    

    /** 来源 */
    
    CGFloat sourceX = CGRectGetMaxX(self.timeFrame) + WQStatusCellInset;
    CGFloat sourceY = timeY;
//    CGFloat sourceW = WQScreenW - CGRectGetMaxX(self.iconFrame);
//    CGSize  maxSize1 = CGSizeMake(sourceW, MAXFLOAT);
    
    
    NSDictionary * sourceAttr = @{NSFontAttributeName:WQStatusOrginalSourceFont};
    
    
    CGSize sourceSize = [status.source sizeWithAttributes:sourceAttr];
    self.sourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
//
//    CGRect sourceRect = [status.source boundingRectWithSize:maxSize1 options:NSStringDrawingUsesLineFragmentOrigin attributes:sourceAttr context:nil];
//    
//    self.sourceFrame = (CGRect){{sourceX,sourceY},sourceRect.size};


    
    /** 正文 */
    
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconFrame)+WQStatusCellInset;
    CGFloat textW = WQScreenW - 2 * WQStatusCellInset;
    CGSize maxSize = CGSizeMake(textW, MAXFLOAT);
       NSDictionary * textAttr = @{NSFontAttributeName:WQStatusOrginalTextFont};

    CGRect  rect = [status.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil];
 
    self.textFrame = (CGRect){{textX,textY},rect.size};
    
    


    CGFloat x= 0;
    CGFloat y = 0;
    CGFloat w = WQScreenW;
    CGFloat h = CGRectGetMaxY(self.textFrame) + WQStatusCellInset;
    self.originalFrame = CGRectMake(x, y, w, h);
    
    
}
@end
