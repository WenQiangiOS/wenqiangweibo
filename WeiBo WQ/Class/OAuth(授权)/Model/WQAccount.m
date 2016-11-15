//
//  WQAccount.m
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/2.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import "WQAccount.h"

@implementation WQAccount
+ (instancetype)accountWithDic:(NSDictionary *)dict {
    WQAccount * account = [[self alloc] init];
    account.expires_in = dict[@"expires_in"];
    account.access_token = dict[@"access_token"];
    account.uid = dict[@"uid"];
    account.name = dict[@"name"];
    
    
    NSDate * now = [NSDate date];
    account.expires_time = [now dateByAddingTimeInterval:account.expires_in.doubleValue];
    
    
    return account;
}


/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.access_token = [coder decodeObjectForKey:@"access_token"];
        self.expires_in = [coder decodeObjectForKey:@"expires_in"];
        self.uid = [coder decodeObjectForKey:@"uid"];
        self.expires_time = [coder decodeObjectForKey:@"expires_time"];
        self.name = [coder decodeObjectForKey:@"name"];
    }
    
    return self;
}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
     [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
     [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expires_time forKey:@"expires_time"];
    [aCoder encodeObject:self.name forKey:@"name"];
    
}

@end

