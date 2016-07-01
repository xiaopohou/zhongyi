//
//  LZHttpHelper.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/1.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface LZHttpHelper : NSObject

+(void) getContentWithRetmoteUrl:(NSString *) url success:(void(^)(id responseObject)) success;

+(NSDictionary*) getDictWithUrl:(NSString *) url;
@end
