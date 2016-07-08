//
//  LZClassTableView.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
//分类列表table框架
@interface LZClassTableView : UITableViewController
@property(nonatomic,strong) NSArray *dataList;
@property(nonatomic,assign) NSInteger currentPageIndex;
@end
