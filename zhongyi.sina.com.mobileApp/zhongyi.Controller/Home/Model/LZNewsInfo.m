//
//  LZNewsInfo.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/29.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZNewsInfo.h"

@implementation LZNewsInfo
//对内方法
-(instancetype) initModelWithDic:(NSDictionary *) dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


//对外方法
+(instancetype) initModelWithDictionary:(NSDictionary *) dict
{
    return [[self alloc]initModelWithDic:dict];
}
@end
