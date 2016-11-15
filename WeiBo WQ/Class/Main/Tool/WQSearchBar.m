//
//  WQSearchBar.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/18.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQSearchBar.h"

@implementation WQSearchBar
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设置中间UITextField
            // 设置textField 的背景
        self.background =[UIImage resizedImage:@"navigationbar_searchbar_background"];
            // 设置内容--垂直居中
            self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            // 设置leftview
        
        
            UIImageView * leftView = [[UIImageView alloc] init];
            leftView.image = [UIImage imageNamed:@"searchbar_textfield_down_icon"];
            //设置leftview 的 的size
            leftView.width = leftView.image.size.width+10;
            leftView.height = leftView.image.size.width+10;
            //设置leftView 的显示模式永远显示
            self.leftViewMode = UITextFieldViewModeAlways;
            // 设置leftView的内容居中
            self.contentMode = UIViewContentModeCenter;
        //设置清除的按钮一直显示
            self.clearButtonMode = UITextFieldViewModeAlways;
            self.leftView = leftView;
       
    }
    return self;
}


+ (instancetype)searchBar {
    return [[self alloc] init];
}
@end
