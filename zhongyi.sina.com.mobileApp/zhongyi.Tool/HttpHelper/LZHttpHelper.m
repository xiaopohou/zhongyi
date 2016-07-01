//
//  LZHttpHelper.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/1.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZHttpHelper.h"

@implementation LZHttpHelper

+(void) getContentWithRetmoteUrl:(NSString *) url  success:(void(^)(id responseObject)) success
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
      //NSString *userAgent = [NSString stringWithFormat:@"iOS/%@/2.15.0",[[UIDevice currentDevice] name]];
    //[manager.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSString *result=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

 
@end
