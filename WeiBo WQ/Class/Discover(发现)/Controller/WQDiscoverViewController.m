//
//  WQDiscoverViewController.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/17.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQDiscoverViewController.h"
#import "WQSearchViewController.h"
@interface WQDiscoverViewController ()
@end
@implementation WQDiscoverViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISearchBar * bar = [[UISearchBar alloc] init];
    [bar setSearchFieldBackgroundImage:[UIImage imageNamed:@"search_navigationbar_textfield_background_highlighted"] forState:UIControlStateNormal];
   bar.placeholder = @"大家都在搜: LOL S6总决赛";
    
   bar.frame = CGRectMake(0, 0, 300, 35);
    
    
    UIButton * button = [[UIButton alloc] init];
    [button setBackgroundColor:[UIColor clearColor]];
    button.frame = bar.frame;
    [bar addSubview:button];
    
    self.navigationItem.titleView = bar;

    
    
    [button addTarget:self action:@selector(searchVc) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)searchVc {
    WQLOG(@"searchVc");
    WQSearchViewController * searchView = [[WQSearchViewController alloc] init];
    
    [self.navigationController pushViewController:searchView animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    cell.textLabel.text = [NSString stringWithFormat:@"发现测试数据 ---%ld",indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewController * newVc = [[UITableViewController alloc] init];
    newVc.view.backgroundColor = [UIColor whiteColor];
    
    WQLOG(@"%@",self.navigationController);
    
    [self.navigationController pushViewController:newVc animated:YES];
}

@end
