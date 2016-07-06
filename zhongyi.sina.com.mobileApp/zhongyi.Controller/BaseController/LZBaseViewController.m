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
#define customerCellId @"contentCollectionViewIdentifier"
//实现协议
@interface LZBaseViewController ()<LZTitleScrollTitleDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@end



@implementation LZBaseViewController

//@synthesize titleArray=_titleArray;

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
    }
    return _titleScrollView;
}
//左右滑动滑动容器
-(LZContentCollectionView *) contentScrollView
{
    if (_contentScrollView==nil)
    {
        CGFloat collectViewHeight=ScreenH-CGRectGetMaxY(self.titleScrollView.bounds)-49;
        CGFloat collectViewY=CGRectGetMaxY(self.titleScrollView.frame);

        _contentScrollView=[[LZContentCollectionView alloc]initWithFrame:CGRectMake(0, collectViewY, ScreenW,collectViewHeight) collectionViewLayout:self.layoutView];

       _contentScrollView.delegate=self;
        _contentScrollView.dataSource=self;
        _contentScrollView.pagingEnabled=YES;

        NSLog(@"------>%ld",self.titleArray.count);
        
        
        for (int i = 0; i < self.titleArray.count; i++)
        {
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
    //NSLog(@"collectioncell数量：---%ld",self.titleArray.count);
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
    cellItem.cid=classModel.cid;
    return cellItem;
}
#pragma collectionview 左右滚动事件
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int currentIndex=self.contentScrollView.contentOffset.x/self.contentScrollView.bounds.size.width;
    
    NSLog(@"-----%d",currentIndex);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

-(void) installWebUI
{
    
    [self.view addSubview:self.titleScrollView];
    
    [self.view addSubview:self.contentScrollView];
}

//实现协议
-(void) titleScrollView:(LZTitleScrollView *) sender withLabel:(UILabel *) lable
{
    NSInteger index=lable.tag;
    
    
    //NSLog(@"%d---%d",index,self.lastIndex);
    
    UILabel *currentLabel=self.titleScrollView.subviews[self.lastIndex];
    currentLabel.textColor=[UIColor colorWithRed:22.0/255.0 green:147.0/255.0 blue:114.0/255.0 alpha:1.0];
    lable.textColor=[UIColor whiteColor];

    self.lastIndex=index;
    [self.contentScrollView setContentOffset:CGPointMake(ScreenW*index, 0)];
    //NSLog(@"hello");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
