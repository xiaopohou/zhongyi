//
//  LZBaseViewController.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/30.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZBaseViewController.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define customerCellId @"customercellId"
//实现协议
@interface LZBaseViewController ()<LZTitleScrollTitleDelegate>

@end



@implementation LZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.automaticallyAdjustsScrollViewInsets = NO;
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

        _titleScrollView=[[LZTitleScrollView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 37)];
        
        _titleScrollView.titleArray=self.titleArray;
        _titleScrollView.titleDelegate=self;
        
    NSLog(@"--C--->%d",self.titleArray.count);  
        
    }
    return _titleScrollView;
}
//左右滑动滑动容器
-(LZContentCollectionView *) contentScrollView
{
    if (_contentScrollView==nil) {
        
        NSLog(@"--F--->%d",self.titleArray.count);
        
        //可操作区域=总高-头、底部控件高度
        
        //此句话不能解除注释，否则下面的collectionview就会出现位置错误，导致滚动菜单看不见了
 
//        CGFloat collectViewHeight=ScreenH-CGRectGetMaxY(self.titleScrollView.frame)-49;
//        CGFloat collectViewWeight=CGRectGetMaxY(self.titleScrollView.frame);
        
//        NSLog(@"--A--->%f",collectViewHeight);   //110
//        
//        NSLog(@"--B--->%f",collectViewWeight);   //586
        
        
        _contentScrollView=[[LZContentCollectionView alloc]initWithFrame:CGRectMake(0, 101, ScreenW,586) collectionViewLayout:self.layoutView];

//        _contentScrollView.delegate=self;
//        _contentScrollView.dataSource=self;
        _contentScrollView.pagingEnabled=YES;


        for (int i = 0; i < self.titleArray.count; i++) {
            [_contentScrollView registerClass:[LZCollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%d",customerCellId,i]];
        }
    }
    return _contentScrollView;
}

-(UICollectionViewFlowLayout *) layoutView
{
    if (_layoutView==nil) {
        _layoutView=[[UICollectionViewFlowLayout alloc]init];
        _layoutView.itemSize=self.contentScrollView.bounds.size;
        _layoutView.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        _layoutView.minimumInteritemSpacing=0;
        _layoutView.minimumLineSpacing=0;

    }
    return _layoutView;
}

#pragma uicollectionview的数据源代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"collectioncell数量：---%ld",self.titleArray.count);
    return self.titleArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LZCollectionViewCell *cellItem=[collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%d",customerCellId,(int)indexPath.row] forIndexPath:indexPath];
;
    
    LZClassModel *classModel=self.titleArray[indexPath.row];
    cellItem.url=classModel.url;
    cellItem.title=classModel.title;
    return cellItem;
}

-(void) installWebUI
{
    
    [self.view addSubview:self.titleScrollView];
    
    [self.view addSubview:self.contentScrollView];
}

//实现协议
-(void) titleScrollView:(LZTitleScrollView *) sender withLabel:(UILabel *) lable
{
    NSLog(@"hello");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
