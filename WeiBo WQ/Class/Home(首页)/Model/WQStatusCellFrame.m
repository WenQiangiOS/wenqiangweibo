//
//  WQStatusCellFrame.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQStatusCellFrame.h"
#import "WQstatuses.h"
#import "WQStatusDetailFrame.h"


@implementation WQStatusCellFrame
- (void)setStatus:(WQstatuses *)status {
    _status = status;
    
    //设置微博正文frame
    
    [self setupDetailFrame];

    
    //设置微博toolbar的frame
    [self setupToolbarFrame];
    
    //设置微博每个cell间距
    [self setMarginViewFrame];
    
    self.cellHeight = CGRectGetMaxY(self.cellMargin);
    
}

//设置微博正文frame

- (void)setupDetailFrame {
    WQStatusDetailFrame * detailFrame = [[WQStatusDetailFrame alloc] init];
    detailFrame.status = self.status;
    self.detailFrame = detailFrame;
}


   //设置微博toolbar的frame
- (void)setupToolbarFrame {
    

    CGFloat toolX = 0;
    CGFloat toolY = CGRectGetMaxY(self.detailFrame.frame);
    CGFloat toolW = WQScreenW;
    CGFloat toolH = 35;
    
    self.toolBarFrame = CGRectMake(toolX, toolY, toolW, toolH);
}

- (void)setMarginViewFrame {
    CGFloat x = 0;
    CGFloat y = CGRectGetMaxY(self.toolBarFrame);
    CGFloat w = WQScreenW;
    CGFloat h = WQStatusCellInset;
    self.cellMargin = CGRectMake(x, y, w, h);
    
}
@end
