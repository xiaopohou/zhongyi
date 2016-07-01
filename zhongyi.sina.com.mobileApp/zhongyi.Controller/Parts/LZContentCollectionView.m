//
//  LZContentCollectionView.m
//  zhongyi.sina.com.mobileApp
//
//  Created by Monkey on 16/7/1.
//  Copyright © 2016年 zhongyi. All rights reserved.
//

#import "LZContentCollectionView.h"

@implementation LZContentCollectionView

-(instancetype)  initWithFrame:(CGRect)frame withLayout:(UICollectionViewFlowLayout*) layout
{
    if (self=[super initWithFrame:frame  collectionViewLayout:layout]) {
        self.backgroundColor=[UIColor whiteColor];
    }
    return  self;
}

@end
