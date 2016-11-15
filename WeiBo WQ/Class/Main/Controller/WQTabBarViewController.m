//
//  WQTabBarViewController.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/16.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQTabBarViewController.h"
#import "WQHomevViewController.h"
#import "WQMessageViewController.h"
#import "WQDiscoverViewController.h"
#import "WQProfileViewController.h"
#import "WQNavigationController.h"
#import "WQTabBar.h"
#import "WQCompose.h"
#import "WQUserTool.h"
#import "WQAccountTool.h"
#import "WQAccount.h"

@interface WQTabBarViewController ()<UITabBarControllerDelegate,WQTabBarDelegate>
@property (nonatomic , weak) WQHomevViewController * home;
@property (nonatomic , weak) WQMessageViewController * message;
@property (nonatomic , weak) WQProfileViewController * profile;
@property (nonatomic , weak) UIViewController * lastSelectViewController;

@end

@implementation WQTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.delegate = self;
    
  
 //添加子控制器
    [self addAllChildVcs];
     // 用自己的tabbar覆盖系统的tabbar
    [self addSelfTabBar];
    
    
   NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(showUnReadCount) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
  
}

/**
 *  监控点击tabbarItem
 */

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController {
    
    UIViewController * vc  = [viewController.viewControllers firstObject];
    
    if ([vc isKindOfClass:[WQHomevViewController class]]) {
        if (self.lastSelectViewController == vc) {
            [self.home refresh:YES];
        } else {
            [self.home refresh:NO];
        }
    }
    self.lastSelectViewController = vc;
    
    
}


/**
 *  显示未读信息
 */
- (void)showUnReadCount {
    
    
    WQUnReadCountParam * params = [WQUnReadCountParam params];
    params.uid = [WQAccountTool account].uid;
    [WQUserTool unreadCountWithParams:params success:^(WQUnreadCountResult *result) {
        if (result.status == 0) {
            self.home.tabBarItem.badgeValue = nil;
        } else {
            self.home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.status];
        };
        
        
        if (result.messageCount == 0) {
            self.message.tabBarItem.badgeValue  = nil;
        } else {
            self.message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.messageCount];
        };
        
        if (result.follower == 0) {
            self.profile.tabBarItem.badgeValue  = nil;
        } else {
            self.profile.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.follower];
        };
   
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
          [UIApplication sharedApplication].applicationIconBadgeNumber = result.totalCount;
        
        

    } failure:^(NSError *error) {
        WQLOG(@"error %@",error);
    }];
    
}


/**
 *  用自己的tabbar覆盖系统的tabbar
 */
- (void)addSelfTabBar {
    
    
    WQTabBar * tabBar = [[WQTabBar alloc] init];
    tabBar.tabBarDelegate = self;
    
    [self setValue:tabBar forKey:@"tabBar"];
}
/**
 *  添加子控制器
 */
- (void)addAllChildVcs {
    
    
    WQHomevViewController * home = [[WQHomevViewController alloc] init];
    [self addChildView:home title:@"首页" imageName:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    self.home = home;
    
    
    WQMessageViewController * message = [[WQMessageViewController alloc] init];
    [self addChildView:message title:@"消息" imageName:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    self.message = message;
    
    
    WQDiscoverViewController* discover = [[WQDiscoverViewController alloc] init];
    [self addChildView:discover title:@"发现" imageName:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    //
    WQProfileViewController * profile = [[WQProfileViewController alloc] init];
    [self addChildView:profile title:@"我" imageName:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    self.profile = profile;
    
}



/**
 *  添加一个子控制器的方法
 *
 *  @param childView    自控制器对象
 *  @param title        标题
 *  @param imageName    图标
 *  @param selectedName 选中图标
 */
- (void)addChildView:(UIViewController *)childView title:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedName {

    childView.title = title;  // 相当于同时设置了 TabBar标签 和导航控制器标签
    
    childView.tabBarItem.image = [UIImage imageWithName:imageName];
    
    UIImage * selectedImage= [UIImage imageWithName:selectedName];
    
    
    //设置normal状态下的tabbar的文字颜色
    NSDictionary * attrs = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    
    [[UITabBarItem appearance]setTitleTextAttributes:attrs forState:UIControlStateNormal];
    // 设置selected 的文字颜色
    NSDictionary * attr2 =@{NSForegroundColorAttributeName:[UIColor orangeColor]};
    
    [[UITabBarItem appearance]setTitleTextAttributes:attr2 forState:UIControlStateSelected];


    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childView.tabBarItem.selectedImage = selectedImage;
    
    WQNavigationController * nav = [[WQNavigationController alloc] initWithRootViewController:childView];
    [self addChildViewController:nav];
   
}

/**
 *  切换发微博控制器
 */

- (void)tabBarDidClickedPlusButton:(WQTabBar *)tabBar {
    
    WQCompose * composeVc = [[WQCompose alloc] init];
    WQNavigationController * composeNa = [[WQNavigationController alloc] initWithRootViewController:composeVc];
    
    [self presentViewController:composeNa animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
