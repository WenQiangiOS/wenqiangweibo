//
//  WQHomevViewController.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/17.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQHomevViewController.h"
#import "WQOneViewController.h"
#import "WQTitleButton.h"
#import "WQPopMeun.h"
#import "WQAccountTool.h"
#import "WQAccount.h"
#import "UIImageView+WebCache.h"
#import "MJExtension.h"
#import "WQstatuses.h"
#import "WQUser.h"
//#import "WQPhoto.h"
#import "MBProgressHUD+MJ.h"
#import "WQLoadingMoreFooter.h"
#import "WQStatusTool.h"
#import "WQUserTool.h"
#import "WQStatusCellFrame.h"
#import "WQStatusCell.h"

#import "WQRadarView.h"


@interface WQHomevViewController ()<WQPopMenuDelegate>
@property (nonatomic , strong) NSMutableArray * statusFrame;
@property (nonatomic , weak) WQLoadingMoreFooter * footer;
@property (nonatomic , weak)UIRefreshControl * wqrefreshControl;
@property (nonatomic , weak) WQTitleButton * titleButton;

@end
@implementation WQHomevViewController

#pragma mark 懒加载
//懒加载数据
- (NSMutableArray *)statusFrame {
    if (_statusFrame == nil) {
        _statusFrame = [NSMutableArray array];
    }
    return _statusFrame;
}

- (NSArray *)statusFrameWithStatuse:(NSArray *)statuses {
    NSMutableArray * frames = [NSMutableArray array];
    
    for (WQstatuses * status in statuses) {
        WQStatusCellFrame * frame = [[WQStatusCellFrame alloc] init];
        frame.status = status;
        [frames addObject:frame];
    }
    
    return frames;
}

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
        // 设置导航栏控制器
    [self setUpNavigation];

    // 设置刷新控制器
    [self setUpRefreshControl];
    
    self.view.backgroundColor = WQLittleGray;
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        //设置用户id
    [self setUpUserInfo];
//    });
   
}


// 设置导航栏控制器
- (void) setUpNavigation{
    //1左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendattention_dot" hightImageImageName:@"navigationbar_friendattention_dot_highlighted" target:self action:@selector(friendSearch)];
    
    //2 右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_icon_radar" hightImageImageName:@"navigationbar_icon_radar_highlighted" target:self action:@selector(pop)];
    
    WQLOG(@"WQHomevViewController-------viewDidLoad");
    
    // titleView
    WQTitleButton * titleButton = [[WQTitleButton alloc] init];
    titleButton.height = titleButton.imageView.image.size.height + 30;
    NSString * name = [WQAccountTool account].name;
    [titleButton setTitle:name ? name: @"首页" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setBackgroundImage:[UIImage resizedImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    
    
    
    [titleButton addTarget:self action:@selector(titleButtonCicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
    self.titleButton = titleButton;
    
}

//集成刷新控制器
- (void)setUpRefreshControl {
    // 创建刷新控制器
    UIRefreshControl * refreshControl = [[UIRefreshControl alloc] init];
    
    self.wqrefreshControl = refreshControl;
    //将控制器添加到tableview 中
    [self.tableView addSubview:refreshControl];
    //添加刷新控制器的监控方法
    [refreshControl addTarget:self action:@selector(refreshControlStatesChange:) forControlEvents:UIControlEventValueChanged];
    //自动刷新一次
    [refreshControl beginRefreshing];
    //调用刷新的的方法
    [self refreshControlStatesChange:refreshControl];
    
    //上拉刷新
    
    WQLoadingMoreFooter * footer =[WQLoadingMoreFooter loadingMoreView];
    
    self.tableView.tableFooterView = footer;
    
    self.footer = footer;
    
}

//设置用户id
- (void)setUpUserInfo {
    
    //分装请求参数
    WQUserInfoParms * parms = [WQUserInfoParms params];
    parms.uid =@([[WQAccountTool account].uid longLongValue]);


    
    [WQUserTool userInfoWithParams:parms success:^(WQUserInfoResult *result) {
        
        // 设置标题的按钮的名称
        [self.titleButton setTitle:result.name forState:UIControlStateNormal];
        //存储账号信息
        WQAccount * account = [WQAccountTool account];
        account.name = result.name;
        [WQAccountTool save:account];
    } failure:^(NSError *error) {
            WQLOG(@"用户信息获取失败error %@",error);
    }];
    

}



#pragma mark 刷新
- (void)refresh:(BOOL)formSelf {
    if (self.tabBarItem.badgeValue) { // 有数字
        // 转圈圈
        [self.wqrefreshControl beginRefreshing];
        
        //刷新数据
        [self loadNewStatus:self.wqrefreshControl];
    } else if (formSelf) { // 没有数字
        // 让表格回到顶部
        NSIndexPath * firstPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView scrollToRowAtIndexPath:firstPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}


#pragma mark 控件的点击方法

//刷新控制器的监控方法
- (void)refreshControlStatesChange:(UIRefreshControl *)refreshControl {
    [self loadNewStatus:refreshControl];
}


#pragma mark 网络加载数据
/**
 *  刷新小菊花在转动的时候 加载新的网络数据

 */
- (void)loadNewStatus:(UIRefreshControl *)refreshControl{
    //封装请求参数
    WQHomeStatusesParms * parms = [WQHomeStatusesParms params];
    
    WQStatusCellFrame * fristFrame = [self.statusFrame firstObject];
    WQstatuses * fristStatuses = fristFrame.status;
    if (fristStatuses) {
        parms.since_id = @([fristStatuses.idstr longLongValue]);
    }
    
    //加载微博数据
    [WQStatusTool homeStatusWithParams:parms success:^(WQHomeStatusesResult *result) {
        

        //字典转模型
        NSArray * newStatuses = [self statusFrameWithStatuse:result.statuses];
        //新的字典模型的范围
        NSRange range = NSMakeRange(0,newStatuses.count);
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        
        //以前数据中插入新的数据
        [self.statusFrame insertObjects:newStatuses atIndexes:indexSet];
        
        // 刷新tableView
        [self.tableView reloadData];
        // 刷新结束后停止刷新控件
        [refreshControl endRefreshing];
        
        //添加微博刷新数状态
        [self selfStatuesCount:newStatuses.count];
    } failure:^(NSError *error) {
        WQLOG(@"刷新加载请求失败请求失败____%@",error);
        //请求失败 刷新控件停止刷新
        [refreshControl endRefreshing];
    }];
}

//上拉刷新时的加载
- (void)loadMoreStatues {
    //封装请求管理者参数
    WQHomeStatusesParms * parms = [WQHomeStatusesParms params];
    WQStatusCellFrame * moreStatusFrmae = [self.statusFrame lastObject];
    WQstatuses * moreStatuses = moreStatusFrmae.status;
    if (moreStatuses) {
        
        parms.max_id = @([moreStatuses.idstr  longLongValue]- 1 );
    }

    // 加载微博更多数据
    
    [WQStatusTool homeStatusWithParams:parms success:^(WQHomeStatusesResult *result) {
        
        //获得更多微博数据
        NSArray * moreStatuses = [self statusFrameWithStatuse:result.statuses];
        
        // 将最新的数据加载到后面
        [self.statusFrame addObjectsFromArray:moreStatuses];
        
        //刷新tableView
        [self.tableView reloadData];
        
        // 菊花停止转动
        [self.footer endRefreshing];
    } failure:^(NSError *error) {
        WQLOG(@"Error %@",error);
        //失败也是停止转动
        [self.footer endRefreshing];
    }];
}

#pragma mark  显示微博刷新数量的label
- (void)selfStatuesCount:(NSInteger)count {
    
    
    //设置清零   
    [UIApplication sharedApplication].applicationIconBadgeNumber  -= self.tabBarItem.badgeValue.intValue;
    
    
    //创建label
    UILabel * label = [[UILabel alloc] init];
    //label颜色
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage resizedImage:@"timeline_new_status_background"]];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13];
    //label文字
    if (count) {
        label.text = [NSString stringWithFormat:@"更新了%ld条微博",count];
    }else {
        label.text = @"好友现在没有微博更新";
    }
    
    //label位置
    label.width = self.view.width;
    label.height = 30;
    label.x = 0;
    label.y = 64-label.height;
    
    // 加载到视图中
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    //动画效果
    
    CGFloat duration = 1.0;
//    label.alpha = 0.0;
    
    [UIView animateWithDuration:duration delay:0 options: UIViewAnimationOptionCurveEaseInOut  animations:^{
        // 设置变形
        label.transform = CGAffineTransformMakeTranslation(0, label.height);
        //设置透明度
//        label.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        
        CGFloat delay = 0.75;
        //完成后的设置动画
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //回到原位
            label.transform = CGAffineTransformIdentity;
            //透明度为0
//            label.alpha = 0;
            
        } completion:^(BOOL finished) {
            //移除label
            [label removeFromSuperview];
            
        }];
    }];

    
    
    
}



#pragma mark pop弹出菜单
/**
 *  点击titleView后出现的方法
 *
 */

- (void)titleButtonCicked:(UIButton *)titleButton {
    
    WQLOG(@"cicked");
      [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.backgroundColor = [UIColor blueColor];
    
        WQPopMeun * menu = [[WQPopMeun alloc] initWithContentView:button];
        [menu showInRect:CGRectMake(70, 50, 200, 300)];
//        menu.dimBackgroud = YES;
    
        menu.delegate = self;
}


#pragma mark popMenu 代理方法
- (void)popMenuDismissed:(WQPopMeun *)popMenu {
    
    WQTitleButton * button = (WQTitleButton *)self.navigationItem.titleView;
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down"]  forState:UIControlStateNormal];
}


#pragma mark 寻找朋友接口

/**
 *  点击friendSearch方法
 */

- (void)friendSearch {
    WQLOG(@"寻找盆友");
    WQOneViewController * oneVc = [[WQOneViewController alloc] init];
    [self.navigationController pushViewController:oneVc animated:YES];
}



#pragma mark 雷达接口
/**
 *  点击雷达的方法
 */
- (void)pop {
    WQLOG(@"雷达");
    
    WQRadarView * radarView = [[WQRadarView alloc] init];
    
//    UITableView * tableView = [[UITableView alloc] init];
    WQPopMeun * leidaView = [WQPopMeun popMenuWithContentView:radarView];
    leidaView.arrowPostion = WQPopMeunArrowRight;
    leidaView.backgroundColor = [UIColor clearColor];
    leidaView.dimBackgroud = NO;
    
    [leidaView showInRect:CGRectMake(self.view.width - 130, 50, 130, 150)];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark tableViewDelegate 方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning 当没有数据的时候,loadingMoreFooter 不显示
    tableView.tableFooterView.hidden = self.statusFrame.count == 0;
    return self.statusFrame.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WQStatusCell * cell = [WQStatusCell cellWithTableView:tableView];

    
    cell.statusCellFrame = self.statusFrame[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewController * newVc = [[UITableViewController alloc] init];
    newVc.view.backgroundColor = [UIColor whiteColor];
    
    WQLOG(@"%@",self.navigationController);
    
    [self.navigationController pushViewController:newVc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WQStatusCellFrame * statusFrame = self.statusFrame[indexPath.row];
    return statusFrame.cellHeight;
}
#pragma mark scrollview 的代理方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.statusFrame.count<=0 || self.footer.isRefreshing) return;     CGFloat delta = scrollView.contentSize.height - scrollView.contentOffset.y;
    
    CGFloat footerH = self.view.height - self.tabBarController.tabBar.height;
    if (delta <= (footerH - 0) ) {
        
        //开始刷新
        [self.footer begingRefreshing];
        
        //延迟两秒后加载数据
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //加载数据
            [self loadMoreStatues];
        });
    }
}


@end
