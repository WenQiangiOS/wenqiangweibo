//
//  WQOAuthViewController.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/10/29.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQOAuthViewController.h"
#import "MBProgressHUD+MJ.h"
#import "WQTabBarViewController.h"
#import "WQNewFeature.h"
#import "WQControlTool.h"
#import "WQAccountTool.h"
#import "WQAccount.h"

@interface WQOAuthViewController ()<UIWebViewDelegate>

@end

@implementation WQOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView * webView    = [[UIWebView alloc] init];
    [self.view addSubview:webView];
    webView.frame          = self.view.bounds;

    // url 字符串地址
    NSString * urlStr      = [NSString stringWithFormat: @"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",APPKEY,REDIRECTURL];
    // 加载url
    NSURL * url            = [NSURL URLWithString:urlStr];
    //request 加载url
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    // webview  加载request
    [webView loadRequest:request];
    //设置代理
    webView.delegate       = self;
    
    }


/**
 *  webView 所有的网页回调都是要经过这个代理
 *
 *  @param request        request 的回调地址
 *
 *  @return YES 就是回调到那个页面  NO 就是不回调那个页面
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {



    NSString * url      = request.URL.absoluteString;
    NSString * rangeStr = [NSString stringWithFormat:@"%@/?code=",REDIRECTURL];

    NSRange range = [url rangeOfString:rangeStr];
    //回调地址是  http://www.baidu.com/?code=89c4138a3ea45b46463fafd7b451120d 截取 后面的code
    if (range.location != NSNotFound) {
        NSInteger from  = range.location + range.length;
        NSString * code = [url substringFromIndex:from];
        // 获取请求标记后的方法
       [self accessTokenWithCode:code];
// 一旦截取到的时候后面回调页面不显示
        return NO;
        
    }
    
    
    return  YES;
}

- (void)accessTokenWithCode:(NSString *)code {
    
    //请求参数
    WQAccessTokeParam * parms = [[WQAccessTokeParam alloc] init];
    parms.client_id = APPKEY;
    parms.client_secret = APPSECRET;
    parms.grant_type = @"authorization_code";
    parms.redirect_uri = REDIRECTURL;
    parms.code = code;
    

    
    [WQAccountTool accesstokenWithParams:parms success:^(WQAccount *account) {

        // 储存账号
        [WQAccountTool save:account];
        
        //选择控制器
        [WQControlTool chooseRootViewController];
        
        //隐藏HUD
        [MBProgressHUD hideHUD];
    } failure:^(NSError *error) {
        //隐藏HUD
        [MBProgressHUD hideHUD];
        
        WQLOG(@"Error %@",error);
    }];
 


    
    
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
       [MBProgressHUD showMessage:@"拼命加载中"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideHUD];
}

@end
