//
//  LZNews.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/7.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZNews.h"
#import "LZHttpHelper.h"
@implementation LZNews

-(instancetype) initModelWithDict:(NSDictionary *) dict
{
    LZNews *model=[LZNews new];
    model.title=dict[@"title"];
    model.imgUrl=dict[@"imgurl"];
    model.createTime=dict[@"createtime"];
    model.content=dict[@"Content"];
    model.infoid=dict[@"id"];
    return  model;
}
+(instancetype) initWithDict:(NSDictionary *)dict
{
    return [[self alloc]initModelWithDict:dict];
}
+(void) loadModelListWithRemoteUrl:(NSString *) url success:(successRequestNews)callback
{
   // __weak typeof (self) weakself=self;
    
    [LZHttpHelper getContentWithRetmoteUrl:url success:^(id responseObject) {
        NSError *error=nil;
        NSString *jsonStr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];

        NSData *jsonData=[jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *dictInfo=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        NSMutableArray *mutiNews=[NSMutableArray new];

        NSDictionary *dictModelList=dictInfo[@"data"];
        
        for (NSDictionary *dicItem in dictModelList) {
            LZNews *model=[LZNews initWithDict:dicItem];
            [mutiNews addObject:model];
        }
        callback(mutiNews.copy);
    }];
}

@end
