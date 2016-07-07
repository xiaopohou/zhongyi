//
//  HomeViewController.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/28.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZHomeViewController.h"
#import "LZClassModel.h"
#import "LZDetailViewController.h"

@implementation LZHomeViewController

-(instancetype) init
{
    if (self=[super init]) {
        
           self.titleArray=[LZClassModel loadModelWithPlistPath:@"class.plist"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //很奇怪的一句话，不加的话导航栏会出现坐标不准的情况
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //注册通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(RedirectToDetailViewPage:) name:KNotificationNameForContentView object:nil];
    
#pragma 加载远程无法解决
    //对base类属性赋值
    //[LZClassModel initDictWithRemoteUrl:@"http://58.83.218.135:9999/api/iossource/queryclass"  success:^(NSArray *result) {
    //        self.titleArray=result;
    //
    //        [self installWebUI];
    
    //调用base初始化组件
    //[self performSelectorOnMainThread:@selector(installWebUI) withObject:nil waitUntilDone:YES];
    //}];
    
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotificationMessage:) name:@"setUI" object:nil];
    
#pragma 临时加载本地配置文件返回菜单数据
    [self setNav];
     self.titleArray=[LZClassModel loadModelWithPlistPath:@"class.plist"];
    [self installWebUI];
    
}

-(void) RedirectToDetailViewPage:(NSNotification *) notification
{
    LZDetailViewController *delailView=[[LZDetailViewController alloc]init];
    NSString *newsId=notification.userInfo[KNotificationObjectKeyName];
    delailView.oid=newsId;
    [self.navigationController pushViewController:delailView animated:NO];
}

-(void) setNav
{
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search-night"] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick:)];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more-night"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick:)];
    
    self.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.rightBarButtonItem=rightItem;
    
}
-(void)leftItemClick:(UIBarButtonItem *) sender
{
    NSLog(@"搜索点击");
}
-(void)rightItemClick:(UIBarButtonItem *) sender
{
     NSLog(@"more点击");
}
//-(void) receiveNotificationMessage:(NSNotification *) notification
//{
//    if ([[notification name] isEqualToString:@"setUI"]) {
//      NSDictionary *dictInfo=  notification.userInfo;
//        
//    NSArray *reustData=dictInfo[@"classlist"];
//        
//    NSLog(@"---------收到更新UI通知,返回数据:%@",reustData); 
//    self.titleArray=reustData;
//    [self installWebUI];
//    }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
   
}

@end
