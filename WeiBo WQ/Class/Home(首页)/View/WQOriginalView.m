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
#import "WQStatusPhotosView.h"
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
/** v图标 */
@property (nonatomic , weak)UIImageView * vView ;


/**
 *  会员
 */
@property (nonatomic , weak)UIImageView * vipView;

@property (nonatomic , weak) WQStatusPhotosView * photosView;





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
        textLabel.textColor = WQMoreBlack;
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
//        timeLabel.backgroundColor = [UIColor yellowColor];
        timeLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        // 头像
        UIImageView * iconView = [[UIImageView alloc]init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
//        // 加V图标
//        UIImageView * vView = [[UIImageView alloc] init];
//        [self addSubview:vView];
//        self.vView = vView;
        
        
        //图片
        WQStatusPhotosView * photosView = [[WQStatusPhotosView alloc] init];
        [self addSubview:photosView];
        self.photosView = photosView;
        
        
        //会员
        
        UIImageView * vipView = [[UIImageView alloc] init];
        [self addSubview:vipView];
        self.vipView = vipView;
        
        
        
      
    }
    return self;
}


- (void)setOrginalFrame:(WQOriginalFrame *)orginalFrame {
    _orginalFrame = orginalFrame;
    self.frame = orginalFrame.originalFrame;
    
    
    //取出微博数据
    
    WQstatuses * status = orginalFrame.status;
    WQUser * user = status.user;
    
    
    self.iconView.frame = orginalFrame.iconFrame;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage resizedImage:@"avatar_default"]];
    
    //头像切成圆形
    self.iconView.layer.cornerRadius = orginalFrame.iconFrame.size.width * 0.5;
    self.iconView.layer.masksToBounds = YES;
    [self.iconView.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor clearColor])];
    self.iconView.contentMode = UIViewContentModeScaleAspectFit;
    

    
    
    
    // 昵称
    self.nameLabel.text = user.name;
    self.nameLabel.frame = orginalFrame.nameFrame;
    if (user.isVip) {//会员
        self.nameLabel.textColor = [UIColor orangeColor];
        self.vipView.hidden = NO;
        self.vipView.frame = orginalFrame.vipFrame;
        self.vipView.image = [UIImage imageNamed:[NSString stringWithFormat:@"common_icon_membership_level%d",user.mbrank]];
    } else {
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
        
    }


    
    //正文
    self.textLabel.text = status.text;
    self.textLabel.frame = orginalFrame.textFrame;


    
    // 时间
    self.timeLabel.text = status.created_at;
    CGFloat timeX = CGRectGetMinX(self.nameLabel.frame);
    CGFloat timeY = CGRectGetMaxY(self.nameLabel.frame) + WQStatusCellInset;
    NSDictionary * timeAttributes = @{NSFontAttributeName:WQStatusOrginalTimeFont};
    CGSize timeSize = [status.created_at sizeWithAttributes:timeAttributes];
    self.timeLabel.frame = (CGRect){{timeX,timeY},timeSize};

    
    
    // 来源
    self.sourceLabel.text = status.source;
    CGFloat sourceX = CGRectGetMaxX(self.timeLabel.frame) + WQStatusCellInset;
    CGFloat sourceY = timeY;
    NSDictionary * sourceAttr = @{NSFontAttributeName:WQStatusOrginalSourceFont};
    CGSize sourceSize = [status.source sizeWithAttributes:sourceAttr];
    self.sourceLabel.frame = (CGRect){{sourceX,sourceY},sourceSize};
    
    
    //图片
    if (status.pic_urls.count) {
        self.photosView.frame = orginalFrame.photosFrame;
        self.photosView.pic_urls = status.pic_urls;
        self.photosView.hidden = NO;
    } else{
        self.photosView.hidden = YES;
    }
    
    
    
    


    
    
}



@end
