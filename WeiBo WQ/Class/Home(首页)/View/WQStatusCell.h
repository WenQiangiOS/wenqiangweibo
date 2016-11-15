//
//  WQStatusCell.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//  微博cell 是有toolBar 和detailview组成

#import <UIKit/UIKit.h>
@class WQStatusCellFrame;
@interface WQStatusCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic , strong)WQStatusCellFrame * statusCellFrame;
@end
