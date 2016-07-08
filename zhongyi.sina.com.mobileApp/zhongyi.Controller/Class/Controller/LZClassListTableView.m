//
//  LZClassListTableView.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZClassListTableView.h"
#import "LZNewsListViewController.h"
@interface LZClassListTableView ()
 
@end

@implementation LZClassListTableView

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void) setCid:(NSString *)cid
{
    NSString *url=[NSString stringWithFormat:@"%@%@",KClassListNewsDataApi,self.cid];
    [LZNews loadModelListWithRemoteUrl:url
                               success:^(NSArray *data) {
                                   self.datalist=data;
                               }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.datalist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    LZNews *model=[self.datalist objectAtIndex:indexPath.row];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KClassTableViewItemTag2];
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KClassTableViewItemTag2 forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KClassTableViewItemTag2];
    }
    cell.textLabel.text=model.title;
    return cell;
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.navigationController) {
        NSLog(@"1");
    }else
    {
        //通知最外层跳转
        LZClassModel *model=[self.datalist objectAtIndex:indexPath.row];
        NSDictionary *dictInfo=[NSDictionary dictionaryWithObject:model.cid forKey:KNotificationNewsDetailParamKey];
        [[NSNotificationCenter defaultCenter]postNotificationName:KNotification_RedirectNewsList object:nil userInfo:dictInfo];
    }
}

@end
