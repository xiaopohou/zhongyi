//
//  LZNewsListItemCell.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZNews.h"

@interface LZNewsListItemCell : UITableViewCell
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *imgUrl;
@property(nonatomic,strong) NSString *createTime;

@end
