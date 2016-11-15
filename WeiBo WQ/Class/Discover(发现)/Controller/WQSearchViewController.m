//
//  WQSearchViewController.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/17.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQSearchViewController.h"
#import "WQSearchBar.h"
@interface WQSearchViewController ()

@end

@implementation WQSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [[UIButton alloc] init];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    // 设置右边取消按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
  
    
    
    
    WQSearchBar * searchbar = [WQSearchBar searchBar];
    searchbar.width = 300;
    searchbar.height = searchbar.leftView.size.height;
    searchbar.text = @"简单点";
    
    self.navigationItem.titleView = searchbar;
    
    
    

    
    

}

- (void)cancel {
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
