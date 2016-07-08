//
//  LZClassTableView.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZClassTableView.h"
#import "LZClassModel.h"
#import "LZClassListTableView.h"
#import "LZNewsListViewController.h"
@interface LZClassTableView ()

@end

@implementation LZClassTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame=CGRectMake(0, 64, KScreenWidth, KScreenHeight);
    
}

-(void) setDataList:(NSArray *)dataList
{
    if(_dataList!=dataList)
    {
       _dataList=dataList;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KClassTableViewItemTag1];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KClassTableViewItemTag1 forIndexPath:indexPath];
    LZClassModel *model=[self.dataList objectAtIndex:indexPath.row];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KClassTableViewItemTag1];
    }
    cell.textLabel.text=model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (self.navigationController) {
//        NSLog(@"1");
//    }
//    else
//    {
         NSLog(@"1");
 
        //通知最外层跳转
        LZClassModel *model=[self.dataList objectAtIndex:indexPath.row];
        
        NSDictionary *dictInfo=@{KNotificationNewsListParamKey:model.cid};
    
        [[NSNotificationCenter defaultCenter]postNotificationName:KNotification_RedirectNewsList object:nil userInfo:dictInfo];
    //}
}

@end
