//
//  WQstatuses.h
//  WeiBo WQ
//
//  Created by 闻强 on 2016/11/3.
//  Copyright © 2016年 闻强. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WQUser;
@interface WQstatuses : NSObject
/**string 	微博创建时间*/
@property (nonatomic , copy)NSString * created_at;

 /**	int64 	微博ID*/
@property (nonatomic , assign) int  id;


/**	int64 	微博MID*/
@property (nonatomic , assign) int  mid ;

 /**	string 	字符串型的微博ID*/
@property (nonatomic , copy)NSString * idstr;

 /**	string 	微博信息内容*/
@property (nonatomic , copy)NSString * text;

 /**	string 	微博来源*/
@property (nonatomic , copy)NSString * source;

// 	boolean 	是否已收藏，true：是，false：否
//@property (nonatomic , assign,getter isFavorited) BOOL  favorited
//truncated 	boolean 	是否被截断，true：是，false：否

  /**	string 	中等尺寸图片地址，没有时不返回此字段*/
@property (nonatomic , copy)NSString * bmiddle_pic;

  /**	string 	原始图片地址，没有时不返回此字段*/
@property (nonatomic , copy)NSString * original_pic;

 /**geo 	object 	地理信息字段 详细*/

 /**	object 	微博作者的用户信息字段 详细*/
@property (nonatomic , strong) WQUser * user ;

 /** 	object 	被转发的原微博信息字段，当该微博为转发微博时返回 详细*/
@property (nonatomic , strong)WQstatuses * retweeted_status;

 /** 	int 	转发数*/
@property (nonatomic , assign) int  reposts_count;


 /** 	int 	评论数*/
@property (nonatomic , assign) int  comments_count;


 /** 	int 	表态数*/
@property (nonatomic , assign) int  attitudes_count;

 /**visible 	object 	微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；*/

/**list_id为分组的组号*/

 /**object 	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。*/
@property (nonatomic , strong)NSArray * pic_urls;

 /**ad 	object array 	微博流内的推广微博ID*/
@end
