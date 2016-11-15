//
//  WQUnreadCountResult.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/13.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQUnreadCountResult.h"

@implementation WQUnreadCountResult
- (int)messageCount
{
    return self.cmt + self.dm + self.mention_cmt + self.mention_status;
}

- (int)totalCount
{
    return self.messageCount + self.status + self.follower;
}

@end
