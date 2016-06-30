//
//  LZNewsInfo.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/29.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZNewsInfo : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *cid;

@property (nonatomic,copy) NSString *imgurl;

@property (nonatomic,copy) NSString *infourl;

@property (nonatomic,copy) NSString *sendtime;

-(instancetype) initModelWithDic:(NSDictionary *) dict;

+(instancetype) initModelWithDictionary:(NSDictionary *) dict;
@end
