//
//  LZCollectionViewTableView.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/4.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZFocusScrollView.h"
@interface LZCollectionViewContentTableView : UITableViewController
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString * cid;
@property(nonatomic,strong) LZFocusScrollView *focusView;
@property(nonatomic,strong) UIPageControl *pageControl;
@end
