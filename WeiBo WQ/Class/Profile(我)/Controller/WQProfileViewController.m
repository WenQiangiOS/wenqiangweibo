//
//  WQProfileViewController.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/17.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQProfileViewController.h"
#import "WQPopMeun.h"
@interface WQProfileViewController ()<WQPopMenuDelegate>

@end
@implementation WQProfileViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加好友" style:UIBarButtonItemStyleDone target:self action:@selector(addFriends)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(setWB)];
    WQLOG(@"WQProfileViewController-------viewDidLoad");

    
}

- (void)addFriends {
    WQLOG(@"添加朋友");
    
}

- (void)setWB {
    WQLOG(@"设置");
    UITableView * tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor clearColor];
    
    WQPopMeun *  setPop = [[WQPopMeun alloc] initWithContentView:tableView];
    setPop.dimBackgroud = YES;
    setPop.arrowPostion = WQPopMeunArrowLeft;
    
    [setPop showInRect:CGRectMake(self.view.width - 130, 50, 130, 130)];
    

    
    
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID =  @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"我测试数据 ---%ld",indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewController * newVc = [[UITableViewController alloc] init];
    newVc.view.backgroundColor = [UIColor whiteColor];
    
    WQLOG(@"%@",self.navigationController);
    
    [self.navigationController pushViewController:newVc animated:YES];
}

@end
