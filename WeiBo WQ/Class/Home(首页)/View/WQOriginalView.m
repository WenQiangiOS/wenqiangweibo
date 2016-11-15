//
//  WQOriginalView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQOriginalView.h"
#import "WQOriginalFrame.h"
#import "WQUser.h"
#import "WQstatuses.h"
#import "UIImageView+WebCache.h"
@interface WQOriginalView ()
/** 昵称 */
@property (nonatomic , weak)UILabel * nameLabel;
/** 正文 */
@property (nonatomic , weak)UILabel * textLabel;
/** 来源 */
@property (nonatomic , weak)UILabel * sourceLabel;
/** 时间 */
@property (nonatomic , weak)UILabel * timeLabel;
/** 头像 */
@property (nonatomic , weak)UIImageView * iconView;


@end
@implementation WQOriginalView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self ) {
        // 昵称
        UILabel * nameLabel = [[UILabel alloc] init];
        nameLabel.font = WQStatusOrginalNameFont;
        nameLabel.textColor = [UIColor orangeColor];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
       
        //正文
        UILabel * textLabel = [[UILabel alloc] init];
        textLabel.font = WQStatusOrginalTextFont;
        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        // 来源
        UILabel * sourceLabel = [[UILabel alloc] init];
        sourceLabel.font = WQStatusOrginalSourceFont;
        sourceLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        
        // 时间
        UILabel * timeLabel = [[UILabel alloc] init];
        timeLabel.font= WQStatusOrginalTimeFont;
        timeLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        // 头像
        UIImageView * iconView = [[UIImageView alloc]init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
      
    }
    return self;
}


- (void)setOrginalFrame:(WQOriginalFrame *)orginalFrame {
    _orginalFrame = orginalFrame;
    self.frame = orginalFrame.originalFrame;
    
    
    //取出微博数据
    
    WQstatuses * status = orginalFrame.status;
    WQUser * user = status.user;
    
    
    // 头像
//    self.iconView.frame = CGRectMake(10, 10, 35, 35);
    
    self.iconView.frame = orginalFrame.iconFrame;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage resizedImage:@"avatar_default"]];
    
    
    // 昵称
    self.nameLabel.text = user.name;
    self.nameLabel.frame = orginalFrame.nameFrame;

    
    //正文
    self.textLabel.text = status.text;
    self.textLabel.frame = orginalFrame.textFrame;

    
    // 来源
    self.sourceLabel.text = status.source;
    
//    WQLOG(@"%@",status.source);
    self.sourceLabel.frame = orginalFrame.sourceFrame;
    

    
    // 时间
    self.timeLabel.text = status.created_at;
    self.timeLabel.frame = orginalFrame.timeFrame;
    

  
    

    
    
}
@end
