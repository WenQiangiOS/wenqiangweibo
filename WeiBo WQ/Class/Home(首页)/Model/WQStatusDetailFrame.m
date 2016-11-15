//
//  WQStatusDetailFrame.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQStatusDetailFrame.h"
#import "WQstatuses.h"
#import "WQRetweetedFrame.h"
#import "WQOriginalFrame.h"
@interface WQStatusDetailFrame ()




@end
@implementation WQStatusDetailFrame
- (void)setStatus:(WQstatuses *)status {
    _status =status;
    
    //设置微博原文frame
    WQOriginalFrame * originalFrame = [[WQOriginalFrame alloc] init];
    originalFrame.status = status;
    self.originalFrame = originalFrame;
    
    CGFloat detailH = 0;
    //设置微博转发frame
    if (status.retweeted_status) {
        WQRetweetedFrame * retweetedFrame = [[WQRetweetedFrame alloc] init];
        retweetedFrame.retweetedStatus = status.retweeted_status;
        CGRect retweetF = retweetedFrame.retweetedFrame;
        
        
        retweetF.origin.y = CGRectGetMaxY(originalFrame.originalFrame);
        retweetedFrame.retweetedFrame = retweetF;
        self.retweetedFrame = retweetedFrame;
        
        detailH = CGRectGetMaxY(retweetedFrame.retweetedFrame);
        
    } else {
        detailH = CGRectGetMaxY(originalFrame.originalFrame);
    }
    
    
    CGFloat detailX = 0;
    CGFloat detailY = 0;
    CGFloat detailW = WQScreenW;
    
    self.frame = CGRectMake(detailX, detailY, detailW, detailH);
    
}




@end
