//
//  LZClassListTableView.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/8.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZClassListTableView.h"
#import "LZNewsListViewController.h"
#import "LZNewsCell.h"
@interface LZClassListTableView ()
@property(nonatomic,strong) NSMutableArray *newsModelArray;
@property(nonatomic,assign) int tiems;
@end

@implementation LZClassListTableView
-(NSMutableArray *)newsModelArray
{
    if (_newsModelArray==nil) {
        _newsModelArray=[[NSMutableArray alloc]init];
    }
    return _newsModelArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame=CGRectMake(0, 64, KScreenWidth, KScreenHeight);
    self.tiems=0;//初始化
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
        [self.tableView.mj_header endRefreshing];
    }];
    
    self.tableView.mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
        [self.tableView.mj_footer endRefreshing];
    }];
    
    [self loadData];
    [self getNetWorkstate];
}

-(void)getNetWorkstate{
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未识别的网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"不可达的网络(未连接)");
                UIAlertController *ale = [UIAlertController alertControllerWithTitle:@"网络不正常" message:@"当前无网络" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [ale addAction:ac];
                [self presentViewController:ale animated:YES completion:nil];
                break;}
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2G,3G,4G...的网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi的网络");
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];
}

//上拉加载
-(void) loadMoreData
{
    LZNews *newsModel=[self.newsModelArray lastObject];
    
    
    if (!self.cid) {
        return;
    }
    
    //NSLog(@"---newsModel---%d",newsModel.infoid);

    self.tiems=self.tiems+1;
 
    NSString *url=[NSString stringWithFormat:@"%@%@/%d/%@",KClassListNewsDataApi,self.cid,KRemoteServerDefaultPageSize,newsModel.infoid];
    [LZNews loadModelListWithRemoteUrl:url success:^(NSArray *data) {
        //[self.newsModelArray removeAllObjects];
        [self.newsModelArray addObjectsFromArray:data];
        [self.tableView reloadData];
    }];

    
   
}
-(void) loadData
{
    //queryloadmorenews/{kid}/{limit=10}/{infoid=0}
    NSString *url=[NSString stringWithFormat:@"%@%@/%d",KClassListNewsDataApi,self.cid,KRemoteServerDefaultPageSize];
    
    __weak typeof(self) weakself=self;
    AFNetworkReachabilityManager *netWork=[AFNetworkReachabilityManager sharedManager];
    //没有网络
    if (!netWork.isReachable) {
        
    }
    else
    {
        [LZNews loadModelListWithRemoteUrl:url
                                   success:^(NSArray *data)
         {
             [self.newsModelArray removeAllObjects];
             [self.newsModelArray addObjectsFromArray:data];
             self.tiems=0;
             [weakself.tableView reloadData];
             
         }];
    }
}

-(void) setCid:(NSString *)cid
{
    _cid=cid;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.newsModelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    LZNews *model=[self.newsModelArray objectAtIndex:indexPath.row];
    //默认系统
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KClassTableViewItemTag2];
//     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KClassTableViewItemTag2 forIndexPath:indexPath];
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KClassTableViewItemTag2];
//    }
//    cell.textLabel.text=model.title;
    
    
    //自定义Cell(xib)
    [self.tableView registerNib:[UINib nibWithNibName:@"LZNewsCell" bundle:nil] forCellReuseIdentifier:KClassTableViewItemTag2];
    
    LZNewsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:KClassTableViewItemTag2 forIndexPath:indexPath];
    if (cell==nil) {
        
        cell=[[LZNewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KClassTableViewItemTag2];
    }
    cell.newsModel=model;
    return cell;
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.navigationController) {
        NSLog(@"1");
    }else
    {
        //通知最外层跳转
        LZNews *model=[self.newsModelArray objectAtIndex:indexPath.row];
        NSDictionary *dictInfo=[NSDictionary dictionaryWithObject:model.infourl forKey:KNotificationNewsDetailParamKey];
        
        
        
        [[NSNotificationCenter defaultCenter]postNotificationName:KNotification_RedirectNewsListDetail object:nil userInfo:dictInfo];
    }
}

@end
