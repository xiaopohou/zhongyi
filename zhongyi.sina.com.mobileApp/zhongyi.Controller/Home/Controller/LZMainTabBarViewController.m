//
//  MainTabBarViewController.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/28.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZMainTabBarViewController.h"
#import "LZHomeViewController.h"//首页
#import "LZAboutMeViewController.h"//关于我们
#import "LZSettingViewController.h"//设置
#import "LZClassViewController.h"//分类
#import "LZNavigationViewController.h"


@implementation LZMainTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self LoadControllers];
}
-(void) LoadControllers
{
    LZHomeViewController *homeView=[[LZHomeViewController alloc]init];
    [self addController:homeView withTitle:@"首页" withIamgeUrl:@"tab_home"];
    
    LZClassViewController *classView=[[LZClassViewController alloc]init];
    [self addController:classView withTitle:@"分页" withIamgeUrl:@"topic_off"];
    
    LZAboutMeViewController *aboutView=[[LZAboutMeViewController alloc]init];
    [self addController:aboutView withTitle:@"关于我们" withIamgeUrl:@"tab_dis"];
    
    
    LZSettingViewController *settingView=[[LZSettingViewController alloc]init];
    [self addController:settingView withTitle:@"设置" withIamgeUrl:@"tab_user"];
    

}

-(void) addController:(UIViewController *) view withTitle:(NSString *)title withIamgeUrl:(NSString *) url
{
    view.tabBarItem.image=[UIImage imageNamed:url];
    view.title=title;
    LZNavigationViewController *nav=[[LZNavigationViewController alloc]initWithRootViewController:view];
    [self addChildViewController:nav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
