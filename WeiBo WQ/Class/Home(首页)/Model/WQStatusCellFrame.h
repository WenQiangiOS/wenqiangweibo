//
//  WQStatusCellFrame.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WQstatuses,WQStatusDetailFrame;

@interface WQStatusCellFrame : NSObject
/** 微博数据*/
@property (nonatomic , strong)WQstatuses * status;

/** 微博正文Frame*/
@property (nonatomic , strong)WQStatusDetailFrame * detailFrame;

/** toolBar的frame*/
@property (nonatomic , assign) CGRect  toolBarFrame;

/** 微博cell高度*/
@property (nonatomic , assign) CGFloat  cellHeight;


/** cell之间的间距*/

@property (nonatomic , assign) CGRect  cellMargin;




@end
