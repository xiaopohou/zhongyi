//
//  LZClassListTableView.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZNews.h"
#import "LZClassModel.h"
@interface LZClassListTableView : UITableViewController
@property(nonatomic,strong) NSArray*datalist;
@property(nonatomic,strong) NSString *cid;
 
@end
