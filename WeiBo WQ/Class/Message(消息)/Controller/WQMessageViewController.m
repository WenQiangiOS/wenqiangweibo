//
//  WQMessageViewController.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/17.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQMessageViewController.h"
@interface WQMessageViewController()

@end
@implementation WQMessageViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_icon_newchat" hightImageImageName:@"navigationbar_icon_newchat_highlight" target:self action:@selector(chat) ];

    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发现群" style:UIBarButtonItemStyleDone target:self action:@selector(findGroup)];
    
    WQLOG(@"WQMessageViewController-------viewDidLoad");
    
//    self.navigationItem.leftBarButtonItem.enabled = NO;

}
- (void)chat {
    WQLOG(@"聊天");
}

- (void)findGroup{
    WQLOG(@"发现群");
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID =  @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"消息测试数据 ---%ld",indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewController * newVc = [[UITableViewController alloc] init];
    newVc.view.backgroundColor = [UIColor yellowColor];
    
    WQLOG(@"%@",self.navigationController);
    
    [self.navigationController pushViewController:newVc animated:YES];
}
@end
