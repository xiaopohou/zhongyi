//
//  LZDetailViewController.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/28.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZDetailViewController.h"

@interface LZDetailViewController ()
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation LZDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"正文页";
    self.webView.frame=CGRectMake(0, 44, KScreenWidth,KScreenHeight);
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
    [self.view addSubview:self.webView];
    //NSLog(@"接收的值是：%@",self.oid);
    // Do any additional setup after loading the view.
}
-(UIWebView *)webView
{
    if (_webView==nil) {
        _webView=[[UIWebView alloc]init];
    }
    return _webView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) shareArticle
{
    
}
-(void) localCollect
{
    
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
