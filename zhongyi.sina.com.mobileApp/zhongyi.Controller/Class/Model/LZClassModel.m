//
//  LZClassModel.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/30.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZClassModel.h"
#import "LZHttpHelper.h"
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
+(NSArray *) initArrayWithUrl:(NSString *) url
{
    
    
    return nil;
}

+(void) initDictWithRemoteUrl:(NSString *) url success:(successQueryClassBlock) callback
{
    NSDictionary *dictResult=nil;

    [LZHttpHelper getContentWithRetmoteUrl:url success:^(id responseObject) {
        
    NSError *error;

    NSString *str=[NSJSONSerialization JSONObjectWithData:responseObject options: NSJSONReadingAllowFragments error:&error];

    NSDictionary *jsonDict=[NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];

    NSDictionary *dicList=jsonDict[@"data"];
        
    NSMutableArray *arrayList=[[NSMutableArray  alloc]initWithCapacity:dicList.count];
     
        for (NSDictionary *item in dicList) {
            LZClassModel *classItem=[LZClassModel initTitleModelWithDict:item];
            [arrayList addObject:classItem];
            //NSLog(@"-------------------%@",classItem.title);
        }
        callback([arrayList copy]);
    }];
}

@end
