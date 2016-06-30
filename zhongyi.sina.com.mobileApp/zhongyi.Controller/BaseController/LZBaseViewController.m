//
//  LZBaseViewController.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/30.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZBaseViewController.h"

//实现协议
@interface LZBaseViewController ()<LZTitleScrollTitleDelegate>

@end



@implementation LZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma 懒加载
-(NSArray *)titleArray
{
    if (_titleArray==nil) {
        _titleArray=[[NSArray alloc]init];
    }
    return _titleArray;
}
//初始化标导航
-(LZTitleScrollView *)titleScrollView
{
    if (_titleScrollView==nil) {

        _titleScrollView=[[LZTitleScrollView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 137)];
        _titleScrollView.titleArray=self.titleArray;
        _titleScrollView.titleDelegate=self;
    }
    return _titleScrollView;
}

-(void) installWebUI
{
    [self.view addSubview:self.titleScrollView];
}
//实现协议
-(void) titleScrollView:(LZTitleScrollView *) sender withLabel:(UILabel *) lable
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
