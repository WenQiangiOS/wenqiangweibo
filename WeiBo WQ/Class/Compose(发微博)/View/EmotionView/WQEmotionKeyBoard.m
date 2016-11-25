//
//  WQEmotionKeyBoard.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/25.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQEmotionKeyBoard.h"
#import "WQEmotionListView.h"
#import "WQEmotionToolbarView.h"
#import "MJExtension.h"
#import "WQEmotion.h"
@interface WQEmotionKeyBoard ()<WQEmotionToolBarDelegate>
/***  表情列表*/
@property (nonatomic , weak)WQEmotionListView * listView ;
/***  表情工具条*/
@property (nonatomic , weak)WQEmotionToolbarView * toolbarView;
/***  默认表情*/
@property (nonatomic , strong)NSArray * defaultEmotions;
/***  emoji表情*/
@property (nonatomic , strong)NSArray * emojiEmotions;
/***  浪小花表情*/
@property (nonatomic , strong)NSArray * lxhEmotions;




@end
@implementation WQEmotionKeyBoard

- (NSArray *)defaultEmotions {
    if (_defaultEmotions == nil) {
        NSString * plist = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/default/info.plist" ofType:nil];
        
        self.defaultEmotions = [WQEmotion objectArrayWithFile:plist];
    }
    
    return _defaultEmotions;
}

- (NSArray *)emojiEmotions {
    if (_emojiEmotions ==nil) {
        NSString * plist = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/emoji/info.plist" ofType:nil];
        self.emojiEmotions = [WQEmotion objectArrayWithFile:plist];
    }
    
    return _emojiEmotions;
}

- (NSArray *)lxhEmotions {
    if (_lxhEmotions ==nil) {
        NSString * plist = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/lxh/info.plist" ofType:nil];
        self.lxhEmotions = [WQEmotion objectArrayWithFile:plist];
        
    }
    return _lxhEmotions;
}

+ (instancetype)emotionKeyBoard{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //表情键盘背景颜色
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"emoticon_keyboard_background"]];
    
        //创建emtionListView
        [self setupEmotionListView];
        
        //创建emotionToolBar
        [self setupEmotionToolbar];
        
        
        
        
    }
    return self;
}
 //创建emtionListView
- (void)setupEmotionListView {

    WQEmotionListView * listView = [[WQEmotionListView alloc] init];
    listView.backgroundColor = [UIColor yellowColor];
    self.listView = listView;
    
    [self addSubview:listView];
}


//创建emotionToolBar
- (void)setupEmotionToolbar {
 
    WQEmotionToolbarView * toolbarView = [[WQEmotionToolbarView alloc] init];
//    toolbarView.backgroundColor = [UIColor blueColor];
    toolbarView.delegate = self;
    self.toolbarView = toolbarView;
    [self addSubview:toolbarView];

    
}

- (void)layoutSubviews {
    [super layoutSubviews];
     //设置toolbar的frame
    CGFloat toolbarW = self.width;
    CGFloat toolbarH = 40;
    CGFloat toolbarY = self.height - toolbarH;
    self.toolbarView.frame = CGRectMake(0, toolbarY, toolbarW, toolbarH);
    
    //设置emotionListVie的frame
    self.listView.frame = CGRectMake(0, 0, toolbarW, self.height - toolbarH);
    
}

- (void)emotionToolbar:(WQEmotionToolbarView *)toolbar didSelectedButton:(WQEmotionType)emotionType {
    switch (emotionType) {
        case WQEmotionTypeDefault:
            self.listView.emotions = self.defaultEmotions;
//            WQLOG(@"%@",self.defaultEmotions);
            break;
            
        case WQEmotionTypeEmoji:
            self.listView.emotions = self.emojiEmotions;
            break;
            
        case WQEmotionTypeLxh:
            self.listView.emotions = self.lxhEmotions;
            break;
            
        default:
            break;
    }
    
    
    WQLOG(@"个数%ld,表情%@",self.listView.emotions.count,self.listView.emotions.firstObject);
}

@end
