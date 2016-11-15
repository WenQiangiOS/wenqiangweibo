//
//  WQOneViewController.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/17.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQOneViewController.h"
#import "WQTwoViewController.h"
@interface WQOneViewController ()
- (IBAction)JUMp;

@end

@implementation WQOneViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)JUMp {
    WQTwoViewController * twoVc = [[WQTwoViewController alloc] init];
    
    [self.navigationController pushViewController:twoVc animated:YES];
    
}
@end
