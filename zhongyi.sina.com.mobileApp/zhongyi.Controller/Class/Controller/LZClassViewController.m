//
//  LZClassViewController.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/28.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZClassViewController.h"
#import "LZClassModel.h"
#import "LZNewsListViewController.h"
#import "LZDetailViewController.h"
@interface LZClassViewController ()
@property (nonatomic,strong) LZClassTableView *lzClassTableView;
@end

@implementation LZClassViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
    
    //注册通知（监听跳转列表）
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(RedirectToNewsListViewPage:) name:KNotification_RedirectNewsList object:nil];
    
    //注册通知（监听跳转正文）
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(RedirectToNewsDetialViewPage:) name:KNotification_RedirectNewsListDetail object:nil];
}

//调转列表
-(void) RedirectToNewsListViewPage:(NSNotification *) notification
{
    NSLog(@"收到通知----s");
        NSString *parameterValue=[notification.userInfo objectForKey:KNotificationNewsListParamKey];
        NSLog(@"%@",parameterValue);
        LZNewsListViewController *newsListView=[[LZNewsListViewController alloc]init];
        newsListView.cid=parameterValue;
        [self.navigationController pushViewController:newsListView animated:YES];
    
    
    NSLog(@"收到通知----e");
}
//调转详情页
-(void) RedirectToNewsDetialViewPage:(NSNotification *) notification
{
    NSString *parameterValue=[notification.userInfo objectForKey:KNotificationNewsDetailParamKey];
    LZDetailViewController *detailView=[[LZDetailViewController alloc] init];
    
    detailView.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detailView animated:YES];
}
-(LZClassTableView *) lzClassTableView
{
    if (_lzClassTableView==nil) {
        _lzClassTableView=[[LZClassTableView alloc]init];
    }
    return _lzClassTableView;
}
-(void) setUI
{
    [LZClassModel initDictWithRemoteUrl:KClassDataApi success:^(NSArray *result) {
        self.lzClassTableView.dataList=result;
       [self.view addSubview:self.lzClassTableView.tableView];
    }];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
