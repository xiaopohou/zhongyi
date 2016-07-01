//
//  HomeViewController.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/28.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZHomeViewController.h"
#import "LZClassModel.h"

@implementation LZHomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //很奇怪的一句话，不加的话导航栏会出现坐标不准的情况
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    //对base类属性赋值
    [LZClassModel initDictWithRemoteUrl:@"http://58.83.218.135:9999/api/iossource/queryclass"  success:^(NSArray *result) {
        self.titleArray=result;
        //[self installWebUI];
        //调用base初始化组件
        [self performSelectorOnMainThread:@selector(installWebUI) withObject:nil waitUntilDone:YES];
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
