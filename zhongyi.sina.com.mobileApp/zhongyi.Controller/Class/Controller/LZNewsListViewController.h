//
//  LZNewsListViewController.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZClassListTableView.h"
@interface LZNewsListViewController : UIViewController
@property (nonatomic,strong) LZClassListTableView *lzClassListTableView;
@property (nonatomic,strong) NSString *cid;
@end
