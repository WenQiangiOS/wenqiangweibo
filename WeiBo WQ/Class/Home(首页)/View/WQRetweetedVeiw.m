//
//  WQRetweetedVeiw.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQRetweetedVeiw.h"
#import "WQUser.h"
#import "WQRetweetedFrame.h"
#import "WQstatuses.h"
#import "WQStatusPhotosView.h"
@interface WQRetweetedVeiw ()
//昵称
@property (nonatomic , weak)UILabel * nameLabel;

//正文
@property (nonatomic , weak)UILabel * textLabel;


//图片
@property (nonatomic , weak)WQStatusPhotosView * photosView;


@end
@implementation WQRetweetedVeiw
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self ) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = WQLittleGray;
        //昵称
        UILabel * nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor colorWithRed:0.35 green:0.50 blue:0.61 alpha:1];
        nameLabel.font = WQStatusRetweetedNameFont;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        //正文
        UILabel * textLabel = [[UILabel alloc] init];
        textLabel.font = WQStatusRetweetedTextFont;
        textLabel.textColor =WQLtttleBlack ;

        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        
        //图片
        
        WQStatusPhotosView * photosView = [[WQStatusPhotosView alloc] init];
        [self addSubview:photosView];
        self.photosView = photosView;
        

    }
    return self;
}


- (void)setRetweetedFrame:(WQRetweetedFrame *)retweetedFrame {
    _retweetedFrame = retweetedFrame;
    
    //取出微博数据
    self.frame = retweetedFrame.retweetedFrame;
    
    WQstatuses * status = retweetedFrame.retweetedStatus;
    WQUser * user = status.user;
    
    //昵称
    self.nameLabel.text = user.name;
    self.nameLabel.frame = retweetedFrame.nameFrame;
    
    
    //正文
    self.textLabel.text = status.text;
    self.textLabel.frame = retweetedFrame.textFrame;
    
    
    //图片
    
    //图片
    if (status.pic_urls.count) {
        self.photosView.frame = retweetedFrame.photosFrame;
        self.photosView.pic_urls = status.pic_urls;
        self.photosView.hidden = NO;
    } else{
        self.photosView.hidden = YES;
    }
    
    
    
}
@end
