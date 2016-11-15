//
//  WQTextView.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/5.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQTextView.h"
@interface WQTextView()
@property (nonatomic , strong)UILabel * placehoderLabel;
@end

@implementation WQTextView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 创建label
        UILabel * placehoderLabel = [[UILabel alloc] init];
        
        placehoderLabel.textColor = [UIColor clearColor];
        placehoderLabel.numberOfLines = 0;
        [self addSubview:placehoderLabel];
        self.placehoderLabel = placehoderLabel;
        self.font = [UIFont systemFontOfSize:14];
        // 设置通知,文字更改后通知textView
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLabel) name:UITextViewTextDidChangeNotification object:self];
      
    }
    return self;
    
}

//销毁通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//改变文字后隐藏label
- (void)changeLabel {
    
    self.placehoderLabel.hidden = (self.text.length != 0);
    
}
// 布局textView里面的placehoder位置
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.placehoderLabel.x = 5;
    self.placehoderLabel.y = 8;
    self.placehoderLabel.width = self.width - 2*self.placehoderLabel.x;
    //根据文字的大小来改变label的长短
    CGSize maxSize = CGSizeMake(self.placehoderLabel.width, MAXFLOAT);
    CGSize placehoderSize = [self.placehoder sizeWithFont:self.placehoderLabel.font constrainedToSize:maxSize];
//    CGSize placehoderSize = [self.placehoder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{} context:<#(nullable NSStringDrawingContext *)#>]
//    
    self.placehoderLabel.height = placehoderSize.height;
   
    
}
//重写font的set方法
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placehoderLabel.font = font;
    //重新布局
    [self setNeedsLayout];
}
//重写placehoder的方法
- (void)setPlacehoder:(NSString *)placehoder {
    _placehoder = [placehoder copy];
    
    self.placehoderLabel.text = placehoder;
    //重新布局
    [self setNeedsLayout];
}

//重写placehoderColor 方法
- (void)setPlacehoderColor:(UIColor *)placehoderColor {
    _placehoderColor = placehoderColor;
    self.placehoderLabel.textColor = placehoderColor;
}

//重写text方法(原因是通知只能监听键盘操作时文字改变)
- (void)setText:(NSString *)text {
    [super setText:text];
    //调用隐藏文字方法
    [self changeLabel];
}
@end
