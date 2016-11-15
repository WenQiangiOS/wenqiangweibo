//
//  WQStatusCell.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/14.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQStatusCell.h"
#import "WQToolbarView.h"
#import "WQDetailView.h"
#import "WQStatusCellFrame.h"
#import "WQMarginVIew.h"
@interface WQStatusCell ()
@property (nonatomic , weak)WQToolbarView * toolbarView;
@property (nonatomic , weak)WQDetailView * detailView;
@property (nonatomic , weak)WQMarginVIew * marginView;


@end
@implementation WQStatusCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString * ider = @"HOME";
    
    
    WQStatusCell * cell = [tableView dequeueReusableCellWithIdentifier:ider];
    
    if (!cell) {
        cell = [[WQStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ider];
    }
    
    return cell;
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 设置工具条
        [self setupToolbar];
        //设置cell里面细节内容
        [self setupDetailView];
        // 设置每个cell 的间距
        [self setupMarginView];
    }
    
    return self;
}
// 设置每个cell 的间距
- (void)setupMarginView {
    WQMarginVIew * marginView = [[WQMarginVIew alloc] init];
    [self.contentView addSubview:marginView];
    self.marginView = marginView;
}
/**
 *  设置工具条
 */
- (void)setupToolbar {
    
    WQToolbarView * toolbarView = [[WQToolbarView alloc] init];
    [self.contentView addSubview:toolbarView];
    self.toolbarView = toolbarView;
    
}


/**
 *  设置cell里面细节内容
 */
- (void)setupDetailView {
    WQDetailView * detailView = [[WQDetailView alloc] init];
    [self.contentView addSubview:detailView];
    self.detailView = detailView;
}


- (void)setStatusCellFrame:(WQStatusCellFrame *)statusCellFrame {
    _statusCellFrame = statusCellFrame;
    
    //内容frame
    self.detailView.detailFrame = statusCellFrame.detailFrame;
    
    
    //工具条frame
    self.toolbarView.frame = statusCellFrame.toolBarFrame;
    
    
    //cell间距
    self.marginView.frame = statusCellFrame.cellMargin;
}
@end
