//
//  LZCollectionViewTableView.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/4.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZCollectionViewContentTableView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface LZCollectionViewContentTableView ()

@end

@implementation LZCollectionViewContentTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoadItemTableData];
    self.automaticallyAdjustsScrollViewInsets=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
-(LZFocusScrollView *) focusView
{
    if (_focusView==nil) {
        CGFloat w=[UIScreen mainScreen].bounds.size.width;
         CGRect frame=CGRectMake(0, 101, ScreenWidth, 320);
        _focusView=[[LZFocusScrollView alloc]initWithFrame:frame];
        //_focusView.backgroundColor=[UIColor blackColor];
        _focusView.delegate=self;
        _focusView.contentOffset=CGPointMake(0,ScreenWidth);
        
        //NSLog(@"--->%f",self.focusView.bounds.size.width);
        
        _focusView.contentSize=CGSizeMake(w*4, self.focusView.frame.size.height);
        _focusView.bounces=NO;
        _focusView.showsHorizontalScrollIndicator=NO;
        _focusView.showsVerticalScrollIndicator=NO;
        _focusView.userInteractionEnabled=YES;
        _focusView.pagingEnabled=YES;
    }
    return _focusView;
}

-(UIPageControl *)pageControl
{
    if (_pageControl==nil) {

        CGRect pageFrame=CGRectMake(0, 300, ScreenWidth, 30);
        _pageControl=[[UIPageControl alloc]initWithFrame:pageFrame];
        _pageControl.numberOfPages=4;
        _pageControl.currentPage=0;
        _pageControl.backgroundColor=[UIColor darkGrayColor];
        [_pageControl addTarget:self action:@selector(pageDotClick:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@"滚动stop");
}
-(void)pageDotClick:(id)sender
{
    int index=[sender currentPage];
    
    NSLog(@"%d",index);
}

-(void) LoadItemTableData
{
    if ([self.title isEqualToString:@"热点"])
    {
        //请求api
        NSString *focusApiUrl=@"http://58.83.218.135:9999/api/iossource/getfocusnews/34/4";
        [LZClassModel initDictWithRemoteUrl:focusApiUrl success:^(NSArray *result) {
            NSLog(@"远程请求数量%lu",(unsigned long)result.count);//3个

            for (int i = 0 ; i<result.count;i++) {
                LZClassModel *model=[result objectAtIndex:i];
                CGRect imageFrame=CGRectMake(i*ScreenWidth, 0, self.focusView.bounds.size.width, 320);
                UIImageView *imgItem=[[UIImageView alloc]initWithFrame:imageFrame];
                [imgItem sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:nil];
                [self.focusView addSubview:imgItem];
            }
        }];


        self.focusView.backgroundColor=[UIColor greenColor];
         //画幻灯片
        //[self.focusView addSubview:self.pageControl];
        self.tableView.tableHeaderView=self.focusView;

    }
    else if([self.title isEqualToString:@"图库"])
    {
       
        self.view.backgroundColor=[UIColor yellowColor];
    }else
    {
        self.view.backgroundColor=[UIColor blueColor];
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    
    
    return cell;
}
 

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
