//
//  WQSendStatusParms.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQAccessToken.h"
@interface WQSendStatusParms :WQAccessToken
/**true 	string 	要发布的微博文本内容，必须做URLencode，内容不超过140个汉字。*/
@property (nonatomic , copy)NSString * status;
@end
