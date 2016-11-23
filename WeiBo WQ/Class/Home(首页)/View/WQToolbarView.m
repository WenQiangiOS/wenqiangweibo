//
//  WQToolbarView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQToolbarView.h"
#import "WQstatuses.h"
@interface WQToolbarView ()
@property (nonatomic , strong)NSMutableArray * btns;
@property (nonatomic , strong)NSMutableArray * dividers;

@property (nonatomic , weak) UIButton * repostsBtn;
@property (nonatomic , weak) UIButton * commentBtn;
@property (nonatomic , weak) UIButton * attitudesBtn;




@end
@implementation WQToolbarView

- (NSMutableArray *)btns {
    if (_btns==nil) {
        self.btns = [NSMutableArray array];
    }
    return _btns;
}


- (NSMutableArray *)dividers {
    if (_dividers ==nil) {
        _dividers = [NSMutableArray array];
    }
    return _dividers;
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImage:@"timeline_card_bottom_background"];
        
        

         self.repostsBtn =  [self setupButtonIcon:@"timeline_icon_retweet" addTitle:@"转发"];
        

  
         self.commentBtn = [self setupButtonIcon:@"timeline_icon_comment" addTitle:@"评论"];


          self.attitudesBtn = [self setupButtonIcon:@"timeline_icon_unlike" addTitle:@"赞"];
 
        
        
        [self setupDividers];
        [self setupDividers];
        
    }
    return self;
}
/**
 *  设置分隔线
 */
- (void)setupDividers {
    UIImageView * divider = [[UIImageView alloc] init];
    
    divider.image = [UIImage imageNamed:@"timeline_card_bottom_line_highlighted"];
//    divider.contentMode = UIViewContentModeCenter;
    [self addSubview:divider];
    
    [self.dividers addObject:divider];
}

/**
 *  设置工具条底部的按钮
 *
 *  @param icon  按钮图标名字
 *  @param title 按钮名字
 */
- (UIButton *)setupButtonIcon:(NSString *)icon addTitle:(NSString *)title {
    UIButton * button = [[UIButton alloc] init];
    button.titleLabel.font = WQStatusOrginalTimeFont;
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage resizedImage:@"timeline_card_background"] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage resizedImage:@"timeline_card_background_highlighted"] forState:UIControlStateHighlighted];
    
    button.adjustsImageWhenHighlighted = YES;
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    
    [self addSubview:button];
    
    [self.btns addObject:button];
    
    return button;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnW = self.width / self.btns.count;
    CGFloat btnH = self.height;
    for (int i = 0; i<self.btns.count; i++) {
        UIButton * button = self.btns[i];
        button.width = btnW;
        button.height = btnH;
        button.x = i *btnW;
        button.y = 0;
    }
    
    for (int i = 0; i<self.dividers.count; i++) {
        UIImageView * divider = self.dividers[i];
        divider.width = 1;
        divider.height = btnH*0.8;
        divider.x = (i +1)*btnW;
        divider.y = btnH*0.1;
    }
   
}


- (void)setStatus:(WQstatuses *)status {
    _status = status;
    
    UIButton * buttn =  self.repostsBtn;
    [buttn setTitle:status.reposts_count ?[NSString stringWithFormat:@"%d",status.reposts_count]:@"转发" forState:UIControlStateNormal];

    
    UIButton * commentBtn = self.commentBtn;
    [commentBtn setTitle:status.comments_count ?[NSString stringWithFormat:@"%d",status.comments_count]:@"评论" forState:UIControlStateNormal];
    
    
    UIButton * attitudeBtn =  self.attitudesBtn;
    [attitudeBtn setTitle:status.attitudes_count ?[NSString stringWithFormat:@"%d",status.attitudes_count]:@"赞" forState:UIControlStateNormal];
    
}


@end
