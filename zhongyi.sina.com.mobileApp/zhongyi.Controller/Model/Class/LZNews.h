//
//  LZNews.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/7.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successRequestNews)(NSArray *data);
@interface LZNews : NSObject
@property (nonatomic,strong) NSString *infoid;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *imgUrl;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *infourl;
@property (nonatomic,strong) NSString *createTime;
-(instancetype) initModelWithDict:(NSDictionary *) dict;
+(instancetype) initWithDict:(NSDictionary *)dict;
+(void) loadModelListWithRemoteUrl:(NSString *) url success:(successRequestNews)callback;
@end
