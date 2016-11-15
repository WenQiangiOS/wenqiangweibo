//
//  WQCompose.m
//  WeiBo WQ
//
//  Created by 闻强 on 16/10/25.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQCompose.h"
#import "WQTextView.h"
#import "WQComposeToolBar.h"
#import "WQComposePhotoView.h"
#import "AFNetworking.h"
#import "WQAccount.h"
#import "WQAccountTool.h"
#import "MBProgressHUD+MJ.h"
#import "WQStatusTool.h"
#import "WQHttpTool.h"
@interface WQCompose ()<WQComposeToolBarDelegate,UITextViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic , weak)WQTextView * textView;
@property (nonatomic , weak)WQComposeToolBar * toolBar;
@property (nonatomic , weak)WQComposePhotoView * photoView;
@property (nonatomic , weak)UIBarButtonItem * sendBarBt;



@end

@implementation WQCompose
#pragma mark 私有化方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏
    [self setUpNavigationBar];
    
    // 设置其中的textView
    [self setupTextView];
    
    // 设置工具条
    [self setUpToolBar];
    
    // 设置相册和相机
    [self setupPhotosView];
    
}
// 设置相册和相机
- (void)setupPhotosView {
    
    WQComposePhotoView * photoView = [[WQComposePhotoView alloc] init];
    photoView.width = self.textView.width;
    photoView.height =self.textView.height;
    photoView.y = 70;
    photoView.x = 0;
    
    [self.textView addSubview:photoView];
    self.photoView = photoView;
    
}

// 设置工具条
- (void)setUpToolBar {
    WQComposeToolBar * toolBar = [[WQComposeToolBar alloc] init];
    // 设置frame
    toolBar.width = self.view.width;
    toolBar.height = 44;
    toolBar.y = self.view.height - toolBar.height;
    //设置代理
    toolBar.delegate = self;
    //让toolbar 放入键盘中
    [self.view addSubview:toolBar];
    self.toolBar = toolBar;

}




// 设置其中的textView
- (void)setupTextView {
    WQTextView * textView = [[WQTextView alloc] init];
    textView.frame = self.view.bounds;
    textView.placehoder = @"分享新鲜事........";
    textView.placehoderColor = [UIColor lightGrayColor];
    textView.font = [UIFont systemFontOfSize:14];
    textView.delegate = self;
    self.textView.alwaysBounceVertical = YES;

    
    [self.view addSubview:textView];
    self.textView = textView;

    
    
    // 监听键盘
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHiden:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
   
    
}
//移除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


 // 设置导航栏
- (void)setUpNavigationBar {
    //设置标题
    self.title = @"发微博";
    //设置view的背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    //设置取消的navigationBar的按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    // 定制发送按钮
    UIButton * sendButton= [[UIButton alloc] init];
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setBackgroundImage:[UIImage resizedImage:@"compose_keyboard_dot_normal"] forState:UIControlStateDisabled];
    [sendButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [sendButton setBackgroundImage:[UIImage resizedImage:@"compose_keyboard_dot_selected"] forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat sendButtonW = self.navigationController.navigationBar.height;
    CGFloat sendButtonH = sendButtonW*0.6;
    
    sendButton.size = CGSizeMake(sendButtonW, sendButtonH);
    
    sendButton.titleLabel.font = [UIFont systemFontOfSize:10];
    
    // 设置边距的barButton的边距
    
    UIBarButtonItem * fixSpaceBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixSpaceBar.width = -10;
    
    
    UIBarButtonItem * sendBarBt = [[UIBarButtonItem alloc] initWithCustomView:sendButton];
    sendBarBt.enabled = NO;
    self.sendBarBt = sendBarBt;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:fixSpaceBar ,sendBarBt,nil];
}

#pragma mark 导航栏按钮方法

//取消按钮
- (void)cancel {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark 发微博方法
- (void)send {
    WQLOG(@"发送微博");
    
    if (self.photoView.images.count) {
       
        [self sendStatusesWithImage];
    } else {
        [self senStatuses];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
   
}


// 没有图片微博
- (void)senStatuses {
    
    // 1.封装请求参数
    WQSendStatusParms * parms = [WQSendStatusParms params];
    parms.status = self.textView.text;

    // post请求
   [WQStatusTool sendStatusWithParams:parms success:^(WQSendStatusResult *result) {
        [MBProgressHUD showSuccess:@"发表成功"];
        WQLOG(@"微博发送成功");
    } failure:^(NSError *error) {
        WQLOG(@"微博发送失败error %@",error);
        [MBProgressHUD showError:@"发表失败"];
        WQLOG(@"微博发送失败");
    }];
    
    
    
}
// 有图片微博
- (void)sendStatusesWithImage {
    //获得请求管理者
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    //封装请求参数
    WQSendStatusParms * parms = [WQSendStatusParms params];
    parms.status = self.textView.text;
  
    
    //POST请求
    [mgr POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:parms constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
#warning 新浪只能传一张图片上去
        UIImage * image = [self.photoView.images firstObject];
        NSData * data = UIImageJPEGRepresentation(image, 0.8);
    
        [formData appendPartWithFileData:data name:@"pic" fileName:@"status.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showSuccess:@"发送微博成功"];
        WQLOG(@"微博发送成功");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发送微博失败"];
        WQLOG(@"微博发送失败");
    }];

}

#pragma mark WQComposeToolBarDelegate
- (void)composetool:(WQComposeToolBar *)toolBar didClickedButton:(WQComposeToolButtonType)tag {
    switch (tag) {
        case WQComposeToolButtonCamera:
            WQLOG(@"打开照相机");
            [self openCarmera];
            break;
        case WQComposeToolButtonPicture:
            WQLOG(@"打开相册");
            [self openAblum];
            break;
        case WQComposeToolButtonEmotion:
            WQLOG(@"打开表情");
            [self openEmotion];
            break;
        default:
            break;
    }
}

#pragma mark TextViewDelegete
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.textView endEditing:YES];
}

- (void)textViewDidChange:(UITextView *)textView {
    self.sendBarBt.enabled = textView.text.length != 0;
}


#pragma mark 视图生命周期方法
// 视图加载完成后成为第一响应者(呼叫键盘)也是为了避免界面卡顿
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 监听键盘方法
-(void)keyboardWillShow:(NSNotification *)note {
    // 键盘消失的时候动画时间
    CGFloat durtion = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:durtion animations:^{
        CGRect keyboardF = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardH = keyboardF.size.height;
        
        self.toolBar.transform = CGAffineTransformMakeTranslation(0, -keyboardH);
        
        
    } ];
}

- (void)keyboardWillHiden:(NSNotification*)note {
    //键盘消失的时候动画时间
    CGFloat durtion = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:durtion animations:^{
        self.toolBar.transform = CGAffineTransformIdentity;
    }];
    
}


#pragma mark 工具条里面方法
//打开相机方法
- (void)openCarmera {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])return;
     
     
    UIImagePickerController * ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
    
    
    
}
//打开相册方法
- (void)openAblum {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    
    
    UIImagePickerController * ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
    
}
//打开表情方法
- (void)openEmotion {
    
}

#pragma UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    
    [self.photoView addImage:image];
}
@end
