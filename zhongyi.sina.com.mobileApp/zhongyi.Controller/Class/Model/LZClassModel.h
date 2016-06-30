//
//  LZClassModel.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/30.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(NSArray * result);

@interface LZClassModel : NSObject
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString *url;

+(void) loadModelList:(NSString *) str success:(successBlock) callback;

+(NSArray *) loadModelWithPlistPath:(NSString *) path;

-(instancetype) initModelWithDict:(NSDictionary *) dict;

+(instancetype) initTitleModelWithDict:(NSDictionary *)dict;
@end
