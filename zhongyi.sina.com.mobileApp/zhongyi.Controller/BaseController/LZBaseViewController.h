//
//  LZBaseViewController.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/6/30.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTitleScrollView.h"
#import "LZContentCollectionView.h"
#import "LZCollectionViewCell.h"
#import "LZClassModel.h"
@interface LZBaseViewController : UIViewController
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) LZTitleScrollView *titleScrollView;
@property (nonatomic,strong) LZContentCollectionView *contentScrollView;
@property (nonatomic,strong) UICollectionViewFlowLayout *layoutView;

@property (nonatomic,assign) NSInteger lastIndex;
-(void) installWebUI;

@end
