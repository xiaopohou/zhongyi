//
//  LZDetailViewController.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/28.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZBaseDetailViewController.h"
@interface LZDetailViewController : LZBaseDetailViewController
@property(nonatomic,strong) NSString *oid;
-(void) shareArticle;//分享
-(void) localCollect;//本收
@end
