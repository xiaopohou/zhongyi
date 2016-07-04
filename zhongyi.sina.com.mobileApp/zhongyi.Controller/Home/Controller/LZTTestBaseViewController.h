//
//  LZTTestBaseViewController.h
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/4.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTitleScrollView.h"
#import "LZContentCollectionView.h"
#import "LZCollectionViewCell.h"
#import "LZClassModel.h"
@interface LZTTestBaseViewController : UIViewController

@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) LZTitleScrollView *titleScrollView;
@property (nonatomic,strong) LZContentCollectionView *contentScrollView;
@property (nonatomic,strong) UICollectionViewFlowLayout *layoutView;
-(void) setWebUI;
@end
