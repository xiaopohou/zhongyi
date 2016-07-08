//
//  LZNewsListViewController.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZNewsListViewController.h"

@interface LZNewsListViewController ()
 
@end

@implementation LZNewsListViewController
-(LZClassListTableView *) lzClassListTableView
{
    if (_lzClassListTableView==nil) {
        _lzClassListTableView=[[LZClassListTableView alloc]init];
    
    }
    return _lzClassListTableView;
}
-(void) setCid:(NSString *)cid
{
}
- (void)viewDidLoad {
    [self.view addSubview:self.lzClassListTableView.tableView];

    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
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
