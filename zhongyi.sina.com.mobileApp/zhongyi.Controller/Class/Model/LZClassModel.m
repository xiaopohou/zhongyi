//
//  LZClassModel.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/30.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZClassModel.h"

@implementation LZClassModel

-(instancetype) initModelWithDict:(NSDictionary *) dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype) initTitleModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initModelWithDict:dict];
}

+(NSArray *) loadModelWithPlistPath:(NSString *) path
{
    NSString *resourcePath=[[NSBundle mainBundle] pathForResource:path ofType:nil];
    NSArray *tempArray=[NSArray arrayWithContentsOfFile:resourcePath];
    NSMutableArray *tempMutiArray=[NSMutableArray array];
    
    for (int i = 0; i<tempArray.count; i ++) {
        NSDictionary *tempItem=tempArray[i];
        [tempMutiArray addObject:[self initTitleModelWithDict:tempItem]];
    }
    return tempMutiArray.copy;
}

+(void) loadModelList:(NSString *) str success:(successBlock) callback
{
    NSArray *titleArray=[self loadModelWithPlistPath:str];
    callback(titleArray);
}


@end
