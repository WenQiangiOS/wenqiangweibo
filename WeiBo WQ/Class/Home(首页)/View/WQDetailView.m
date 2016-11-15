//
//  WQDetailView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQDetailView.h"
#import "WQOriginalView.h"
#import "WQRetweetedVeiw.h"
#import "WQStatusDetailFrame.h"

@interface WQDetailView ()
@property (nonatomic , weak)WQOriginalView * originalView ;
@property (nonatomic , weak)WQRetweetedVeiw * retweetedVeiw ;

@end
@implementation WQDetailView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置原生微博
        WQOriginalView * originalView = [[WQOriginalView alloc] init];
        [self addSubview:originalView];
        self.originalView = originalView;
        
        
        //设置转发微博
        
        WQRetweetedVeiw * retweetedVeiw = [[WQRetweetedVeiw alloc] init];
        [self addSubview:retweetedVeiw];
        self.retweetedVeiw = retweetedVeiw;
    }
    
    return self;
}



- (void)setDetailFrame:(WQStatusDetailFrame *)detailFrame {
    _detailFrame = detailFrame;
    self.frame = detailFrame.frame;

    
    //设置原生微博
    self.originalView.orginalFrame = detailFrame.originalFrame;
    
    //设置转发微博
    self.retweetedVeiw.retweetedFrame = detailFrame.retweetedFrame;
 
}
@end
